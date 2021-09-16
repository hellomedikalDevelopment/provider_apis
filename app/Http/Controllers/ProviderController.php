<?php

namespace App\Http\Controllers;

use App\Models\Provider;
use App\Models\Providerdetail;
use App\Models\ProviderImage;
use App\Models\Password_reset;
use App\Models\setSchedule;
use App\Models\customerSupport;
use App\Models\customerSupportImage;
use App\Models\providerSchedule;
use Illuminate\Http\Request;
use Response;
use Validator;
use Carbon\Carbon;
use DB;
use Hash;
use Crypt;
use Illuminate\Foundation\Auth\SendsPasswordResetEmails;
use Illuminate\Support\Facades\Password;
use App\Mail\WelcomeMail;
use Illuminate\Support\Facades\Mail;
use DateTime;

class ProviderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public $unauthorised = 401;
    public $successStatus = 200;
    public $badrequest = 400;

    public function register(Request $request){
        $validator = Validator::make($request->all(), [
            'provider_type' => 'required',
            'name' => 'required',
            'email' => 'required',
            'phone_no' => 'required',
            // 'gender' => 'required',
            // 'department' => 'required',
            // 'country' => 'required',
            // 'state' => 'required',
            // 'town_city' => 'required',
            'password' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(),'status'=>'0'], $this->successStatus);
        }
        else{
            $checkProvider = Provider::where('email',$request->email)->first();
            if($checkProvider){
                return response()->json([
                    'status'=>'0',
                    'message'=>'Email Already Exists',
                ]);
            }else{
                $newUser =  new Provider;
                $newUser->provider_type = $request->provider_type;
                $newUser->name = $request->name;
                $newUser->email = $request->email;
                $newUser->phone_no = $request->phone_no;
                $newUser->gender = $request->gender;
                $newUser->address_type = $request->address_type;
                $newUser->visit_type = $request->visit_type;
                $newUser->department = $request->department;
                $newUser->country = $request->country;
                $newUser->state = $request->state;
                $newUser->town_city = $request->town_city;
                // $newUser->password = $request->password;
                $newUser->zipcode = $request->zipcode;
                $newUser->building_no = $request->building_no;
                $newUser->open_from = $request->open_from;
                $newUser->open_to = $request->open_to;
                $splist = $request->reapeat_schedule;
                $newUser->reapeat_schedule = str_replace(str_split('\\/:*?"<>|[]"'), '', $splist);
                // $newUser->reapeat_schedule = $request->reapeat_schedule;
                $token = (string)mt_rand(100,1000000);
                $token_en = Crypt::encrypt($token);
                $newUser->remember_token = $token_en;
                $newUser->password = Hash::make($request->password);
                $newUser->dr_choice = $request->dr_choice;
                $newUser->reapeat = $request->reapeat;
                $spelist = $request->specialization;
                $newUser->specialization = str_replace(str_split('\\/:*?"<>|[]"'), '', $spelist);
                // $newUser->specialization = $request->specialization;
                $newUser->area = $request->area;
                // $newUser->username = $user_name[0].$randomString;
                $newUser->save();
                
                $userDetail =  new Providerdetail;
                $userDetail->provider_id = $newUser->id;
                $userDetail->save();

                return response()->json([
                    'status'=>'1',
                    'message'=>'User Registered successfully',
                    'id'=>(String)$newUser->id,
                    'token'=> $token_en
                ], $this->successStatus);
            }
        }
    }

    public function login(Request $request){
        $validator = Validator::make($request->all(), [
            'email' => 'required',
            'password' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(),'status'=>'0'], $this->successStatus);
        }
        else{
            $existingUser = Provider::where('email',$request->email)
            ->first();
            if($existingUser){
                if(Hash::check($request->password , $existingUser['password'])){
                    $existingUser->load('detail');
            $existingUser->load('images');
            $imageArr = [];
            foreach ($existingUser->images as $image) {
                $images = url('/').'/storage/provider_media/'.$image->image;
                $imglist['id'] = $image['id'];
                $imglist['image'] = $images;
                $imageArr[] = $imglist;
            }
            if($existingUser->profile_image!=''){
              $profile_image=url('/').'/storage/provider_images/'.$existingUser->profile_image;
             }else{
                $profile_image='';
             }
            $complteteUser = Provider::select('name','email','phone_no','gender','department','country','state','town_city','zipcode','building_no','area','specialization','training','languages','education','affilation','license','certification','aboutyourself','profile_image')->where(['remember_token'=>$existingUser->remember_token])->first();
            
            return response()->json(['status'=>'1','message'=>'Provider fetched successfully','token'=>$existingUser->remember_token,'data'=>[
                'id' => $existingUser->id,
                'provider_type' => $existingUser->provider_type,
                'name' => $existingUser->name,
                'email' => $existingUser->email,
                'phone' => $existingUser->phone_no,
                'gender' => $existingUser->gender,
                'department' => $existingUser->department,
                'country' => $existingUser->country,
                'state' => $existingUser->state,
                'town_city' => $existingUser->town_city,
                'open_from' => $existingUser->open_from,
                'open_to' => $existingUser->open_to,
                'reapeat_schedule' => $existingUser->reapeat_schedule,
                'zipcode' => $existingUser->zipcode,
                'building_no' => $existingUser->building_no,
                'reapeat' => $existingUser->reapeat,
                'specialization' => $existingUser->specialization,
                'area' => $existingUser->area,
                'training' => $existingUser->training,
                'languages' => $existingUser->languages,
                'education' => $existingUser->education,
                'affilation' => $existingUser->affilation,
                'license' => $existingUser->license,
                'certification' => $existingUser->certification,
                'aboutyourself' => $existingUser->aboutyourself,
                'address_type' => $existingUser->address_type,
                'visit_type'=> str_replace(str_split('\\/:*?"<>|[]"'), '', $existingUser->visit_type),
                'profile_completion' => strval($this->calculate_profile($complteteUser)),
                'profile_image' => $profile_image,
                // 'details' => $existingUser->detail,
                'images' => $imageArr,
            ]]);
                  
                }else {
                  return response()->json(['message'=>'Email or Password is incorrect','status'=>'0'], $this->successStatus);
                }
            }else {
                return response()->json(['message'=>'User not found','status'=>'0'], $this->successStatus);
            }
        }
    }

    public function otpMail($email,$otp){
        $name = 'Dear '.$email.' ';
        $email = $email;
        $title = 'OTP for Email Verification';
        $content = 'Here is the otp of your email varification : '.$otp.'';
        // $msg = [
        //     "name" => $name,
        //     "content" => $content
        // ];
        // Mail::send('mail', $msg, function($message) use ($email) {
        //     $message->to($email);
        //     $message->subject('SocialApp');
        // });
        \Mail::send('contactUsMail', [
            'name' => $name, 
            'email' => $email, 
            'title' => $title,
            'content' => $content
        ], function ($message) use ($email) {
            $message->to($email)->subject('Verification Mail');
        });
    }

    public function update(Request $request){
        $saveArray = $request->all();
        $validator = Validator::make($request->all(), [
            'provider_id' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(),'status'=>'0'], $this->successStatus);
        }
        else{
            $userExist = Provider::where('id',$saveArray['provider_id'])->first();
            if($userExist){

                if($request->hasFile('profile_image')){
                    $image = time().$request->profile_image->getClientOriginalName();
                    $request->profile_image->move(public_path('/storage/provider_images') . '/', $image);
                }else{
                    $image = $userExist['profile_image'];
                }

                $data = [];
                if($request->hasfile('images')){
                    foreach($request->file('images') as $key=>$file){
                        $name= time().$file->getClientOriginalName();    
                        $file->move(public_path('/storage/provider_media/') . '/', $name);    
                        $data[$key] = $name;
                        $file= new ProviderImage();
                        $file->provider_id = $userExist->id;
                        $file->image = $data[$key];
                        $file->save();
                    }
                }

                $splist = $saveArray['specialization'];
                $new_splist = str_replace(str_split('\\/:*?"<>|[]"'), '', $splist);
                $lalist = $saveArray['languages'];
                $new_lalist = str_replace(str_split('\\/:*?"<>|[]"'), '', $lalist);
                $schlist = $request->reapeat_schedule;
                $reapeat_schedule = str_replace(str_split('\\/:*?"<>|[]"'), '', $schlist);
                $aflist = $saveArray['affilation'];
                $new_aflist = str_replace(str_split('\\/:*?"<>|[]"'), '', $aflist);

                $updateProfile = [
                    'name'=>$saveArray['name']?$saveArray['name']:$userExist['name'],
                    'gender'=>$saveArray['gender']?$saveArray['gender']:$userExist['gender'],
                    'phone_no'=>$saveArray['phone_no']?$saveArray['phone_no']:$userExist['phone_no'],
                    'department'=>$saveArray['department']?$saveArray['department']:$userExist['department'],
                    'country'=>$saveArray['country']?$saveArray['country']:$userExist['country'],
                    'state'=>$saveArray['state']?$saveArray['state']:$userExist['state'],
                    'town_city'=>$saveArray['town_city']?$saveArray['town_city']:$userExist['town_city'],
                    'zipcode'=>$saveArray['zipcode']?$saveArray['zipcode']:$userExist['zipcode'],
                    'building_no'=>$saveArray['building_no']?$saveArray['building_no']:$userExist['building_no'],
                    'open_from'=>$saveArray['open_from']?$saveArray['open_from']:$userExist['open_from'],
                    'open_to'=>$saveArray['open_to']?$saveArray['open_to']:$userExist['open_to'],
                    'reapeat_schedule'=>$reapeat_schedule?$reapeat_schedule:$userExist['reapeat_schedule'],
                    'visit_type'=>$saveArray['visit_type']?$saveArray['visit_type']:$userExist['visit_type'],
                    'specialization'=>$new_splist?$new_splist:$userExist['specialization'],
                    'area'=>$saveArray['area']?$saveArray['area']:$userExist['area'],
                    'education'=>$saveArray['education']?$saveArray['education']:$userExist['education'],
                    'training'=>$saveArray['training']?$saveArray['training']:$userExist['training'],
                    'affilation'=>$new_aflist?$new_aflist:$userExist['affilation'],
                    'license'=>$saveArray['license']?$saveArray['license']:$userExist['license'],
                    'certification'=>$saveArray['certification']?$saveArray['certification']:$userExist['certification'],
                    'aboutyourself'=>$saveArray['aboutyourself']?$saveArray['aboutyourself']:$userExist['aboutyourself'],
                    'profile_image'=>$image,
                    'languages'=>$new_lalist?$new_lalist:$userExist['languages'],
                    'updated_at'=>date('Y-m-d h:i:s')
                ];
                $update = Provider::where('id', $saveArray['provider_id'])->update($updateProfile);
                return response()->json(['status'=>'1','message'=>'Profile Updated',
            ], $this->successStatus);
            }else{
                return response()->json(['status'=>'0','message'=>'Provider Not Found',
                ], $this->successStatus);
            }
        }
    }

    public function profile(Request $request){
        try{
            $token_de = $request->header('token');
        } catch (DecryptException $e){
            return response()->json(['status' => '0', 'message' => $e]);
        }
        $existingUser = Provider::where(['remember_token'=>$token_de])->first();
        if($existingUser){ 
            $existingUser->load('detail');
            $existingUser->load('images');
            $imageArr = [];
            foreach ($existingUser->images as $image) {
                $images = url('/').'/storage/provider_media/'.$image->image;
                $imglist['id'] = $image['id'];
                $imglist['image'] = $images;
                $imageArr[] = $imglist;
            }
            if($existingUser->profile_image!=''){
              $profile_image=url('/').'/storage/provider_images/'.$existingUser->profile_image;
             }else{
                $profile_image='';
             }
            $complteteUser = Provider::select('name','email','phone_no','gender','department','country','state','town_city','zipcode','building_no','area','specialization','training','languages','education','affilation','license','certification','aboutyourself','profile_image')->where(['remember_token'=>$token_de])->first();
            
            return response()->json(['status'=>'1','message'=>'Provider fetched successfully','data'=>[
                'id' => $existingUser->id,
                'provider_type' => $existingUser->provider_type,
                'name' => $existingUser->name,
                'email' => $existingUser->email,
                'phone' => $existingUser->phone_no,
                'gender' => $existingUser->gender,
                'department' => $existingUser->department,
                'country' => $existingUser->country,
                'state' => $existingUser->state,
                'town_city' => $existingUser->town_city,
                'open_from' => $existingUser->open_from,
                'open_to' => $existingUser->open_to,
                'reapeat_schedule' => $existingUser->reapeat_schedule,
                'zipcode' => $existingUser->zipcode,
                'building_no' => $existingUser->building_no,
                'reapeat' => $existingUser->reapeat,
                'specialization' => $existingUser->specialization,
                'area' => $existingUser->area,
                'training' => $existingUser->training,
                'languages' => $existingUser->languages,
                'education' => $existingUser->education,
                'affilation' => $existingUser->affilation,
                'license' => $existingUser->license,
                'certification' => $existingUser->certification,
                'aboutyourself' => $existingUser->aboutyourself,
                'address_type' => $existingUser->address_type,
                'visit_type'=> str_replace(str_split('\\/:*?"<>|[]"'), '', $existingUser->visit_type),
                'profile_completion' => strval($this->calculate_profile($complteteUser)),
                'profile_image' => $profile_image,
                // 'details' => $existingUser->detail,
                'images' => $imageArr,
            ]]);
        }
        else{
            return response()->json(['message'=>'Unauthorised','status'=>'0'], $this->unauthorised);
        }
    }

  
    public function randomPassword($length = 8) 
    {
      $characters = '23456789abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ';
      $charactersLength = strlen($characters);
      $randomString = '';
      for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
      }
      return $randomString;
    }

    public function forgotPassword(Request $request){
        $saveArray = $request->all();
        if (Provider::where('email', '=', $saveArray['email'])->count() > 0) {
            $checkRest = Password_reset::where('email', '=', $saveArray['email'])->first();
            $otp = rand (1000 , 9999);
            if (empty($checkRest)) {
                $userDetail =  new Password_reset;
                $userDetail->otp = $otp;
                $userDetail->email = $request->email;
                $userDetail->save();
            }else{
                $updateOtp = [
                    'otp' => $otp,
                    'updated_at' => date('Y-m-d h:i:s')
                ];
                $update = Password_reset::where(['email'=>$saveArray['email']])->update($updateOtp);
            }
            $name = $saveArray['email'];
            $msg = [
                "name" => $name,
                "new_password" => $otp
            ];
            $email = $saveArray['email'];
            Mail::send('mail', $msg, function($message) use ($email) {
                $message->to($email);
                $message->subject('Forgot Password');
            });
            return response()->json(['status' =>'1' ,'message'=>'OTP has been sent to your email','otp'=>$otp], $this->successStatus);
            
        } else{
            return response()->json(['status' =>'error' ,'message'=>'Unauthorised'], 401);
        }
    }

    public function newPassword(Request $request){
        $saveArray = $request->all();
        $validator = Validator::make($request->all(), [
            'email' => 'required',
            'newpassword' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(),'status'=>'0'], $this->successStatus);
        }
        else{
            $updatePassword = [
                'password' => Hash::make($request->newpassword),
                'updated_at' => date('Y-m-d h:i:s')
            ];
            $update = Provider::where(['email'=>$saveArray['email']])->update($updatePassword);
            return response()->json(['status' =>'1' ,'message'=>'Password Updated Successfully'], $this->successStatus);
        }
    }
  

    public function changePassword(Request $request)
    {
         $validator = Validator::make($request->all(), [
            'providers_id' => 'required',
            'old_password' => 'required',
            'new_password' => 'required',            
            'confirm_password' => 'required|same:new_password',
            ]);
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(),'status'=>'0'], $this->successStatus);
        }
        else{
            $user_id = $request->providers_id;
            $old_pass = $request->old_password;
            $new_pass = $request->new_password;    
            $user_data = Provider::select('id','password')->where(['id'=>$user_id])->first();    
             if(empty($user_data))
            {
                return response()->json([ 'status' => '0','message' => "Sorry, This Provider not exist."]);           
            }
            else if(Hash::check($old_pass,$user_data->password)!=1)
            {
                return response()->json([ 'status' => '0','message' => "Sorry, Old password not match."]);          
            }      
            DB::table('providers')->where('id',$user_data->id)->update(['password'=>Hash::make($new_pass)]);
            $msg = [ 'status' => '1','message' => "Password reset successfully."];     
            return response()->json($msg);
        }
    }

   private function calculate_profile($profile)
{
    if ( ! $profile) {
        return 0;
    }
    $columns    = preg_grep('/(.+ed_at)|(.*id)/', array_keys($profile->toArray()), PREG_GREP_INVERT);
    $per_column = 100 / count($columns);
    $total      = 0;

    foreach ($profile->toArray() as $key => $value) {
        if ($value !== NULL && $value !== [] && in_array($key, $columns)) {
            $total += $per_column;
        }
    }

    return $total;
}
    public function deleteSchedule(Request $request)
    {
    $validator = Validator::make($request->all(), [
            'providers_id' => 'required',
            'type' => 'required',
            'schedule_date' => 'required',
            ]);
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(),'status'=>'0'], $this->successStatus);
        }
        else{
            $reciveDate=$request->schedule_date;
            $type=$request->type;
           $allData=providerSchedule::where(array('providers_id'=>$request->providers_id))->first();
                  if($allData){
                    $dataDataDecode=json_decode($allData->date_wise,true);
                    if(array_key_exists($reciveDate,$dataDataDecode)){ 
                                   $count= count($dataDataDecode[$reciveDate]);
                                   
                                    foreach($dataDataDecode[$reciveDate] as $key=>$value){
                                      $i = array_search($type, array_keys($value));
                                       if($i===0){
                                        $dataDataDecode[$reciveDate][$key][$type]['timing']=[];
                                       }
                                    }
                                
                                    
                                        /*if($type=='person')
                                        {

                                          unset($dataDataDecode[$reciveDate][0]);
                                        }elseif($type=='video'){
                                            unset($dataDataDecode[$reciveDate][1]);
                                        }else{
                                            return response()->json(['message'=>"invalid type",'status'=>'0'], '200');
                                        }
                                   }else{
                                        if(isset($dataDataDecode[$reciveDate][0][$type])){
                                            unset($dataDataDecode[$reciveDate][0]);
                                        }elseif(isset($dataDataDecode[$reciveDate][1][$type])){
                                             unset($dataDataDecode[$reciveDate][1]);
                                        }*/
                                    
                                 
                                    DB::table('provider_sheduals')->where('providers_id',$request->providers_id)->update(['date_wise'=>json_encode($dataDataDecode)]); 
                                    return response()->json(['message'=>"Shedual delete successfully",'status'=>'1'], '200');
                       
                 }else{
                    $dayDate=json_decode($allData->day_delete,true);
                    if($dayDate){
                        if(array_key_exists($reciveDate,$dayDate)){
                                $oldarray=$dayDate[$reciveDate];
                                array_push($oldarray,$request->type);
                                $dayDate[$reciveDate]=$oldarray;
                            providerSchedule::where(array("providers_id"=>$request->providers_id))->update(array('day_delete' => json_encode($dayDate)));  

                        }else{
                             
                             $dayDate[$reciveDate]=array($request->type);
                             
                             providerSchedule::where(array("providers_id"=>$request->providers_id))->update(array('day_delete' => json_encode($dayDate)));
                        }
                    }else{
                             $newarray=array($reciveDate=>array($request->type));
                             providerSchedule::where(array("providers_id"=>$request->providers_id))->update(array('day_delete' => json_encode($newarray)));
                        }
                   
                    return response()->json(['message'=>"Shedual delete successfully1",'status'=>'1'], '200');
                 }
             }
         }
    }       
   private function newGetDays( $aDefault=NULL )
{
  // Maybe set defaults
    if( ! $aDefault ):
      $aDefault =
      [
        'start'   => '2021-06-12', 
        'end'     => '2021-07-12', 
        'day'     => ['Friday','Sunday'],
        'format'  => 'm-d-Y',
      ];
    endif;  

  // set values  
    $aResult = []; 

    $iStart  = strtotime( $aDefault['start'] );
    $iEnd    = strtotime( $aDefault['end']   );
    $iDay    = 24*60*60;

  // loop one day at a time  
    for($i2=$iStart; $i2<=$iEnd; $i2+=$iDay):
        foreach($aDefault['day'] as $day)
      {
      if( $day == date('l', $i2) ):
        $aResult[] = date( $aDefault['format'], $i2);
      endif;
  }
    endfor;
 
  return $aResult;
}
    public function customerSupport(Request $request)
    {
         $saveArray = $request->all();
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required',
            'phone_no' => 'required',
            'subject' => 'required',
            'message' => 'required',
            'image' => 'required'

        ]);
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(),'status'=>'0'], $this->successStatus);
        }
        else{
            $customer =  new customerSupport;
                $customer->name = $request->name;
                $customer->email = $request->email;
                $customer->phone_no = $request->phone_no;
                $customer->subject = $request->subject;
                $customer->message = $request->message;
                /* if($request->hasFile('image')){
                    $image = time().$request->image->getClientOriginalName();
                    $request->image->move(public_path('/storage/customer') . '/', $image);
                }*/
                //$customer->image = $image;
                $customer->save();
                 if($request->hasfile('image')){
                    foreach($request->file('image') as $key=>$file){
                        $newfile= new customerSupportImage();
                        $mime = $file->getClientMimeType();
                            if(strstr($mime, "video/")){
                                $name= time().$file->getClientOriginalName();
                                $file->move(public_path('/storage/customer/') . '/', $name);    
                                $data[$key] = $name;
                                 $newfile->video = $data[$key];
                            }else if(strstr($mime, "image/")){
                                $name= time().$file->getClientOriginalName();
                                 $file->move(public_path('/storage/customer/') . '/', $name);    
                                $data[$key] = $name;
                                 $newfile->image = $data[$key];
                            }
                        $newfile->customer_id = $customer->id;                       
                        $newfile->save();
                    }
                }
                $allFile = customerSupportImage::select('image','video')->where('customer_id',$customer->id)->get();
                $imageArr = [];
                $video = [];
            foreach ($allFile as $alldata) {
                if(isset($alldata->image))
                {
                $imageArr[] = $alldata->image;
                }
                if(isset($alldata->video))
                {
                     $video[] = $alldata->video;
                 }
            }
             $msg = [
                "name" => $request->name,
                "email" => $request->email,
                "phone_no" => $request->phone_no,
                "subject" => $request->subject,
                "newmessage" => $request->message,
                "image" => $imageArr,
                "video" => $video
            ];
            
            //$email ='sainirohit755@gmail.com';
            $email ='sonalisaini020@gmail.com';
            Mail::send('customermail', $msg, function($message) use ($email) {
                $message->to($email);
                $message->subject('Customer Support');
            });
     
                 return response()->json([ 'status' => '1','message' => "Your data Inserted successfully."]);
        }

    }
    public function deleteAccount(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'why_leave_us' => 'required',
            'providers_id' => 'required',
            'password' => 'required',            
            'retype_password' => 'required|same:password'

        ]);
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(),'status'=>'0'], $this->successStatus);
        }
        else{
            $user_id = $request->providers_id;
            $password = $request->password;
             $user_data = Provider::select('id','password','email')->where(['id'=>$user_id])->first();    
             if(empty($user_data))
            {
                return response()->json([ 'status' => '0','message' => "Sorry, This Provider not exist."]);           
            }
            else if(Hash::check($password,$user_data->password)!=1)
            {
                return response()->json([ 'status' => '0','message' => "Sorry, password is wrong."]);          
            } 
            else
            {

                     $email=$user_data->email;
                if($request->status==2)
                {
                    DB::table('providers')->where('id',$user_data->id)->update(['account_status'=>'0']);       
                    $msg = [ 'status' => '1','message' => "Account Deactivate successfully."]; 
                    $newsage = [
                        "leaveus" => $request->why_leave_us,
                        "newmessage" => "Your Account Deactivate"
                    ];
                     Mail::send('deleteaccount', $newsage, function($message) use ($email) {
                     $message->to($email);
                     $message->subject('Deactivate Account');
                 });
                }
                if($request->status==1)
                {
                    DB::table('providers')->where('id',$user_data->id)->delete();       
                    $msg = [ 'status' => '1','message' => "Account Delete successfully."]; 
                    $newsage = [
                        "leaveus" => $request->why_leave_us,
                        "newmessage" => "Your Account Delete"
                    ];
                   
                Mail::send('deleteaccount', $newsage, function($message) use ($email) {
                     $message->to($email);
                     $message->subject('Delete Account');
                 });
                     
                }   
                return response()->json($msg);

            }   
        }
    }
    
    
    public function deleteProviderImages(Request $request)
    {
       $validator = Validator::make($request->all(), [
            'providers_id' => 'required',
            'image_id' => 'required'
            

        ]);
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(),'status'=>'0'], 400);
        }
        else{
                $res=ProviderImage::where(array('id'=>$request->image_id,'provider_id'=>$request->providers_id))->delete();
                if($res){

                  return response()->json(['message'=>"delete image successfully",'status'=>'1'], 200);
                 }else{
                    return response()->json(['message'=>"opration fail",'status'=>'0'], 200);
                 }
            }    
    }     

    public function deleteProviderProfileImages(Request $request)
    {
       $validator = Validator::make($request->all(), [
            'providers_id' => 'required'
            
        ]);
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(),'status'=>'0'], 400);
        }
        else{
                
                $affected = DB::table('providers')->where('id', $request->providers_id)->update(['profile_image' =>'']);
               
                if($affected){

                   return response()->json(['status'=>'1','message'=>'Profile Updated',], 200);
                 }else{
                    return response()->json(['message'=>"opration fail",'status'=>'0'], 200);
                 }
            }    
    }      

    /**********Set New Shedual******************/

    public function setNewSchedule(Request $request)    
    {   
       $recived=$request->getContent();
       $encoded=json_decode($recived,true);
       if(!empty($encoded)){

       $recive_date= $encoded['date'];
       $provider_id= $encoded['provider_id'];
       if(!empty($recive_date) && !empty($provider_id)){
       $data= $encoded['data'];
       $DateFinalArray=array();
       $DaysFinalArray=array();
      
       $user=providerSchedule::where(array("providers_id"=>$provider_id))->first(); 
       if($user==null){
           foreach($data as $single)
           {
             $Days=array("Sun"=>'',"Mon"=>'',"Tue"=>'',"Wed"=>'',"Thu"=>'',"Fri"=>'',"Sat"=>'');
                
                $DateFinalArray[$recive_date][]=array($single['type']=>array("clinicName"=>$single['clinicName'],"type"=>$single['type'],"timing"=>$single['timing'],"repeat"=>$single['repeat']));
                  
             
                $repats = str_replace(str_split('\\/:*?"<>|[]"'), '', $single['repeat']);
                $repat = explode(',', $repats);

                if($repat[0]!='')
                {
                    
                    if(count($repat))
                    {
                        for($i=0;$i<=count($repat)-1;$i++)
                        {
                            $day=trim($repat[$i]);
                            
                            $Days[$day]=$single['timing'];
                            
                        }
                          
                    }
                    
                } 

                $DaysFinalArray[]=array($single['type']=>array("clinicName"=>$single['clinicName'],"type"=>$single['type'],"timing"=>$Days));  
               
           }   
           if(count($DateFinalArray[$recive_date])<2){
                    if(isset($DateFinalArray[$recive_date][0]['person']))
                    {
                        $DateFinalArray[$recive_date][]=array("video"=>array("clinicName"=>$DateFinalArray[$recive_date][0]['person']['clinicName'],"type"=>"video","timing"=>array()));
                    }elseif(isset($DateFinalArray[$recive_date][0]['video'])){
                        $DateFinalArray[$recive_date][]=array("person"=>array("clinicName"=>$DateFinalArray[$recive_date][0]['video']['clinicName'],"type"=>"person","timing"=>array()));
                    }
              }  

              if(count($DaysFinalArray)<2){
                    if(isset($DaysFinalArray[0]['person']))
                    {
                        $DaysFinalArray[]=array("video"=>array("clinicName"=>$DaysFinalArray[0]['person']['clinicName'],"type"=>"video","timing"=>array("Sun"=>'',"Mon"=>'',"Tue"=>'',"Wed"=>'',"Thu"=>'',"Fri"=>'',"Sat"=>'')));
                    }elseif(isset($DaysFinalArray[0]['video'])){
                        $DaysFinalArray[]=array("person"=>array("clinicName"=>$DaysFinalArray[0]['video']['clinicName'],"type"=>"person","timing"=>array("Sun"=>'',"Mon"=>'',"Tue"=>'',"Wed"=>'',"Thu"=>'',"Fri"=>'',"Sat"=>'')));
                    }
              }    
                $providerSchedule= new providerSchedule;
                $providerSchedule->providers_id=$provider_id;
                $providerSchedule->date_wise=json_encode($DateFinalArray);
                $providerSchedule->day_wise=json_encode($DaysFinalArray);
                $providerSchedule->save();  
                return response()->json(['message'=>'Shedual Saved','status'=>'1'], 200);
                return "insert Success";
       }else{

               
                    $DateFinalArray=json_decode($user->date_wise,true);
                    $DayFinalArray=json_decode($user->day_wise,true);
                    $day_delete=json_decode($user->day_delete,true);

                 if(array_key_exists($recive_date,$DateFinalArray)){
                         unset($DateFinalArray[$recive_date]);
                    }

                  
                foreach($data as $single)
                   {

                      
                       // $Days=array("Sun"=>'',"Mon"=>'',"Tue"=>'',"Wed"=>'',"Thu"=>'',"Fri"=>'',"Sat"=>'');
                    $DateFinalArray[$recive_date][]=array($single['type']=>array("clinicName"=>$single['clinicName'],"type"=>$single['type'],"timing"=>$single['timing'],"repeat"=>$single['repeat']));
                        
                          
                         $repats = str_replace(str_split('\\/:*?"<>|[]"'), '', $single['repeat']);
                         $repats=str_replace(' ', '', $repats);
                         
                         $repat = explode(',', $repats);

                        if($repat[0]!='')
                        {
                            
                            if(count($repat))
                            {
                                 if($day_delete){
                                    foreach($day_delete as $rep=>$val){ 
                                            $NewreciveDate=str_ireplace('-', '/', $rep); 
                                            $covertDate=date("Y-m-d", strtotime($NewreciveDate));

                                            $timestamp = strtotime($covertDate);
                                            $day = date('D', $timestamp); 

                                          
                                               if(in_array($day,  $repat))
                                                { 
                                                    if (($key = array_search($single['type'], $day_delete[$rep])) !== false) {
                                                            unset($day_delete[$rep][$key]);
                                                        }
                                                }
                                            
                                         }
                                     } 

                                    if($DateFinalArray){
                                         foreach($DateFinalArray as $rep=>$val){ 
                                            $NewreciveDate=str_ireplace('-', '/', $rep); 
                                            $covertDate=date("Y-m-d", strtotime($NewreciveDate));

                                            $timestamp = strtotime($covertDate);
                                            $day = date('D', $timestamp); 

                                          
                                               if(in_array($day,  $repat))
                                                { 
                                                   
                                                    if($single['type']=="person")
                                                      {
                                                        if(isset($DateFinalArray[$rep][0]['person'])){
                                                         $DateFinalArray[$rep][0]['person']["timing"]=$single['timing'];
                                                        }elseif(isset($DateFinalArray[$rep][1]['person'])){
                                                            $DateFinalArray[$rep][1]['person']["timing"]=$single['timing'];
                                                        }
                                                      }else{
                                                        if(isset($DateFinalArray[$rep][1]['video']["timing"])){
                                                             $DateFinalArray[$rep][1]['video']["timing"]=$single['timing'];
                                                        }else{
                                                            $DateFinalArray[$rep][0]['video']["timing"]=$single['timing'];
                                                        }
                                                      } 
                                                        
                                                }
                                            
                                         }
                                     }

                                for($i=0;$i<=count($repat)-1;$i++)
                                {
                                    $day=trim($repat[$i]);
                                    
                                    if($single['type']=="person")
                                      {
                                        if(isset($DayFinalArray[0]['person'])){
                                         $DayFinalArray[0]['person']["timing"][$day]=$single['timing'];
                                        }elseif(isset($DayFinalArray[1]['person'])){
                                            $DayFinalArray[1]['person']["timing"][$day]=$single['timing'];
                                        }
                                      }else{
                                        if(isset($DayFinalArray[1]['video']["timing"])){
                                             $DayFinalArray[1]['video']["timing"][$day]=$single['timing'];
                                        }else{
                                            $DayFinalArray[0]['video']["timing"][$day]=$single['timing'];
                                        }
                                      }   
                                }      
                            }
                            
                        }
                   //     $DaysFinalArray[]=array($single['type']=>array("clinicName"=>$single['clinicName'],"type"=>$single['type'],"timing"=>$Days)); 
                       
                     } 
                      providerSchedule::where(array("providers_id"=>$provider_id))->update(array('day_wise' => json_encode($DayFinalArray),'date_wise' => json_encode($DateFinalArray),'video_day_wise'=>$recived,'day_delete'=>json_encode($day_delete)));   

                       return response()->json(['message'=>'Shedual Updated','status'=>'1'], 200);

               }
           }else{
             return response()->json(['message'=>'Please fill required Fields','status'=>'0'], 200);
           }
       }else{ return response()->json(['message'=>'Please send data','status'=>'0'], 400); }
       
    }

    public function getNewSchedule(Request $request)
    {
            $validator = Validator::make($request->all(), [
                'providers_id' => 'required',
                'viewdate' => 'required',
              ]);
            if ($validator->fails()) {
                return response()->json(['message'=>$validator->errors()->first(),'status'=>'0'], $this->successStatus);
            }
            else{
                  $videoDateWise=array();
                  $inPersonDateWise=array();
                  $person=array();
                  $video=array();
                  $daywiseData=null;
                  $reciveDate=$request->viewdate;
                  $NewreciveDate=str_ireplace('-', '/', $reciveDate); 
                  $covertDate=date("Y-m-d", strtotime($NewreciveDate));
                  $timestamp = strtotime($covertDate);
                  $day = date('D', $timestamp); 
                  $allData=providerSchedule::where(array('providers_id'=>$request->providers_id))->first();
                  if($allData){
                    $dataDataDecode=json_decode($allData->date_wise,true);
                    if(array_key_exists($reciveDate,$dataDataDecode)){ 
                        if(isset($dataDataDecode[$reciveDate][0])){

                            if(isset($dataDataDecode[$reciveDate][0]['person'])){
                                 $inPersonDateWise=$dataDataDecode[$reciveDate][0]['person'];
                              }else{
                                $videoDateWise=$dataDataDecode[$reciveDate][0]['video'];
                            }
                        }
                        if(isset($dataDataDecode[$reciveDate][1])){
                             if(isset($dataDataDecode[$reciveDate][1]['person'])){
                                  $videoDateWise=$dataDataDecode[$reciveDate][1]['person'];
                              }else{
                                $videoDateWise=$dataDataDecode[$reciveDate][1]['video'];
                            }
                            
                        }

                        if(!empty($inPersonDateWise['timing']) && !empty($videoDateWise['timing'] ))
                        {
                        $RES=array('status'=>"1",'message'=>"Get shedual successfully",'type'=>'Independent','date'=>$reciveDate,'provider_id'=>$request->providers_id,'data'=>array(0 =>$inPersonDateWise,1 => $videoDateWise));
                        }elseif(!empty($inPersonDateWise['timing'])){
                             $RES=array('status'=>"1",'message'=>"Get shedual successfully",'type'=>'Independent','date'=>$reciveDate,'provider_id'=>$request->providers_id,'data'=>array(0 =>$inPersonDateWise));
                        }elseif(!empty($videoDateWise['timing'])){
                             $RES=array('status'=>"1",'message'=>"Get shedual successfully",'type'=>'Independent','date'=>$reciveDate,'provider_id'=>$request->providers_id,'data'=>array(0 =>$videoDateWise));
                        }else{
                            $RES=array('status'=>"0",'message'=>"No slots found");
                            
                        }
                       return response()->json($RES, 200);
                    }else{    
                        $dayDataDecode=json_decode($allData->day_wise,true);
                        if(isset($dayDataDecode[0])) {

                            if(isset($dayDataDecode[0]['person'])){
                              $person=array('clinicName'=>$dayDataDecode[0]['person']['clinicName'],'type'=>$dayDataDecode[0]['person']['type'],'timing'=>$dayDataDecode[0]['person']['timing'][$day]);
                            }else{
                                $video=array('clinicName'=>$dayDataDecode[0]['video']['clinicName'],'type'=>$dayDataDecode[0]['video']['type'],'timing'=>$dayDataDecode[0]['video']['timing'][$day]);
                            }
                         }
                         if(isset($dayDataDecode[1])) {

                             if(isset($dayDataDecode[1]['person'])){
                              $person=array('clinicName'=>$dayDataDecode[1]['person']['clinicName'],'type'=>$dayDataDecode[1]['person']['type'],'timing'=>$dayDataDecode[1]['person']['timing'][$day]);
                            }else{
                                $video=array('clinicName'=>$dayDataDecode[1]['video']['clinicName'],'type'=>$dayDataDecode[1]['video']['type'],'timing'=>$dayDataDecode[1]['video']['timing'][$day]);
                            }
                             
                            }
                            $dayDate=json_decode($allData->day_delete,true);
                            if($dayDate){
                            if(array_key_exists($reciveDate,$dayDate)){
                                    $innerArray=$dayDate[$reciveDate];
                                    if(in_array("person",  $innerArray))
                                    {
                                        $person['timing']='';
                                    }
                                     if(in_array("video",  $innerArray))
                                    {
                                        $video['timing']='';
                                    }
                            }}

                        if(!empty($person['timing']) && !empty($video['timing']) )
                        { 
                        $RESDAY=array('status'=>"1",'message'=>"Get shedual successfully",'type'=>'Independent','date'=>$reciveDate,'provider_id'=>$request->providers_id,'data'=>array(0 =>$person,1 => $video));
                        }elseif(!empty($person['timing'])){
                             $RESDAY=array('status'=>"1",'message'=>"Get shedual successfully",'type'=>'Independent','date'=>$reciveDate,'provider_id'=>$request->providers_id,'data'=>array(0 =>$person));
                        }elseif(!empty($video['timing'])){
                             $RESDAY=array('status'=>"1",'message'=>"Get shedual successfully",'type'=>'Independent','date'=>$reciveDate,'provider_id'=>$request->providers_id,'data'=>array(0 =>$video));
                        }else{
                            $RESDAY=array('status'=>"0",'message'=>"No slots found");
                            
                        }
                        
                          return response()->json($RESDAY, 200);
                          
                    }
                }else{

                   return response()->json(['message'=>'nothing found'], 200);
                }
            }
    }   
}