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
                    return response()->json([
                        'status' => '1',
                        'message'=>'Logged in successfully', 
                       /* 'user_id'=>(String)$existingUser->id,
                        'provider_type'=>$existingUser->provider_type,
                        'name'=>$existingUser->name,
                        'email'=>$existingUser->email,*/
                        'token'=>$existingUser->remember_token,
                        'data'=>$existingUser,
                    ], $this->successStatus);
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
                'profile_image' => url('/').'/storage/provider_images/'.$existingUser->profile_image,
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
            // }
            // $response = $this->broker()->sendResetLink(
            //     $request->only('email')
            // );
            // if($response == 'passwords.sent'){
            //     $response = 'We have e-mailed your password reset link!';
            //     return response()->json(['status' =>'1' ,'message'=>'success', 'data'=> $response], $this->successStatus);
            // } else{
            //     $response = 'Your password reset email not sent!';
            //     return response()->json(['status' =>'0' ,'message'=>'error', 'data'=> $response], $this->successStatus);
            // }
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
            'schedule_id' => 'required',
            'schedule_date' => 'required',
            ]);
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(),'status'=>'0'], $this->successStatus);
        }
        else{
            $existschedulde=setSchedule::where('providers_id',$request->providers_id)->first();
          
		  if($existschedulde)
            {
                $dates=array();
                $data = json_decode($existschedulde->all_data, true);
                if(!empty($data)){
                foreach($data as $key=>$schedulde)
                {
                    foreach($schedulde as $keys=>$sch)
                    {
                       $dates[] =$sch['schedule_date'];
                    }
                }
                }
                if(in_array($request->schedule_date, $dates))
                {
                   $newda = $request->schedule_date;
                    foreach($data as $key=>$schedulde)
                    {
                        foreach($schedulde as $keys=>$sch)
                        {
                            if($sch['schedule_date']==$newda)
                            {
                               
                                 unset($data[$key]);

                            }
                        }
                    }
                    
                    if(empty($data))
                    {
                       
                     DB::table('set_schedule')                    
            ->where('providers_id', $request->providers_id)
            ->update(['all_data' => '']);
        }
            else
            {
                
                 DB::table('set_schedule')                    
            ->where('providers_id', $request->providers_id)
            ->update(['all_data' => json_encode($data)]);
            }
                    return response()->json([ 'status' => '1','message' => "Schedule removed successfully."]);
            
                    
                }
                else
                {
                     return response()->json([ 'status' => '0','message' => "Sorry, schedule date is not selected."]);
                }
            }
            else
            {
                return response()->json([ 'status' => '0','message' => "Sorry, Provider Not Found."]);
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
	
	/*
	 create by rohit for set shedual
	*/
	public function setSchedule(Request $request)
	{
		$validator = Validator::make($request->all(), [
            'providers_id' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(),'status'=>'0'], $this->successStatus);
        }
        else{


			
			
				
				$recive_date=$request->schedule_date;
                $type=$request->set_schedule_check;
				$MFrom=$request->morning_time_from;
				$MTo=$request->morning_time_to;

				$MidFrom=$request->mid_time_from;
				$MidTo=$request->mid_time_to;

				$EvFrom=$request->evening_time_from;
				$EvTo=$request->evening_time_to;
                
                $user=providerSchedule::where(array("providers_id"=>$request->providers_id))->first(); 
                if($user==null){

                $days=array("Sun"=>array('morning'=>array("to"=>"","from"=>""),'mid'=>array("to"=>"","from"=>""),'evening'=>array("to"=>"","from"=>"")),
                "Mon"=>array('morning'=>array("to"=>"","from"=>""),'mid'=>array("to"=>"","from"=>""),'evening'=>array("to"=>"","from"=>"")),
                "Tue"=>array('morning'=>array("to"=>"","from"=>""),'mid'=>array("to"=>"","from"=>""),'evening'=>array("to"=>"","from"=>"")),
                "Wed"=>array('morning'=>array("to"=>"","from"=>""),'mid'=>array("to"=>"","from"=>""),'evening'=>array("to"=>"","from"=>"")),
                "Thu"=>array('morning'=>array("to"=>"","from"=>""),'mid'=>array("to"=>"","from"=>""),'evening'=>array("to"=>"","from"=>"")),
                "Fri"=>array('morning'=>array("to"=>"","from"=>""),'mid'=>array("to"=>"","from"=>""),'evening'=>array("to"=>"","from"=>"")),
                "Sat"=>array('morning'=>array("to"=>"","from"=>""),'mid'=>array("to"=>"","from"=>""),'evening'=>array("to"=>"","from"=>""))
                );
                    $dates=array($recive_date=>array('morning'=>array("to"=>$MTo,"from"=>$MFrom),'mid'=>array("to"=>$MidTo,"from"=>$MidFrom),'evening'=>array("to"=>$EvTo,"from"=>$EvFrom),'repeat'=>$request->repeat_schedule)
                );
                }
                else{
                    $days=json_decode($user->day_wise,true);
                    $dates=json_decode($user->date_wise,true);
                    if(array_key_exists($recive_date,$dates)){
                         unset($dates[$recive_date]);
                    }
                   $dates[$recive_date]=array('morning'=>array("to"=>$MTo,"from"=>$MFrom),'mid'=>array("to"=>$MidTo,"from"=>$MidFrom),'evening'=>array("to"=>$EvTo,"from"=>$EvFrom),'repeat'=>$request->repeat_schedule);
                } 
				
				$dateWiseDecode=json_encode($dates);

				// insert in date_wise_colmn

				//$repat=["Mon", "Wed", "Thu","Fri"];
				//$repat=$request->repeat_schedule;
                $repats = str_replace(str_split('\\/:*?"<>|[]"'), '', $request->repeat_schedule);
                $repat = explode(',', $repats);

            if($repat[0]!='')
            {
                
				if(count($repat))
				{
					for($i=0;$i<=count($repat)-1;$i++)
					{
						$day=trim($repat[$i]);
						
						$days[$day]["morning"]["to"]=$MTo;
						$days[$day]["morning"]["from"]=$MFrom;


						$days[$day]["mid"]["to"]=$MidTo;
						$days[$day]["mid"]["from"]=$MidFrom;


						$days[$day]["evening"]["to"]=$EvTo;
						$days[$day]["evening"]["from"]=$EvFrom;
					}
					  
					// insert in day_wise_column
				}
				//$array = array_unique(array_merge($days, $Alldays));
            } 
			$daywisedecode= json_encode($days);
            if($user==null){
                if($request->set_schedule_check==1){
                $providerSchedule= new providerSchedule;
                $providerSchedule->providers_id=$request->providers_id;
                $providerSchedule->date_wise=$dateWiseDecode;
                $providerSchedule->day_wise=$daywisedecode;
                $providerSchedule->save();
            }else{
                $providerSchedule= new providerSchedule;
                $providerSchedule->providers_id=$request->providers_id;
                $providerSchedule->video_date_wise=$dateWiseDecode;
                $providerSchedule->video_day_wise=$daywisedecode;
                $providerSchedule->save();
            }
                 return response()->json([
                    'status'=>'1',
                    'message'=>'schedule set successfully',
                    'providers_id'=>$request->providers_id
                ], $this->successStatus);

            }else{
                if($request->set_schedule_check==1){
                   providerSchedule::where(array("providers_id"=>$request->providers_id))->update(array('day_wise' => $daywisedecode,'date_wise' => $dateWiseDecode));
               }else{
                 providerSchedule::where(array("providers_id"=>$request->providers_id))->update(array('video_day_wise' => $daywisedecode,'video_date_wise' => $dateWiseDecode));
               }


                   return response()->json([
                    'status'=>'1',
                    'message'=>'schedule set successfully',
                    'providers_id'=>$request->providers_id
                ], $this->successStatus);
            }
            	
		}
	}
    
	
	public function getProvidersSchedule(Request $request)
	{

        
		 $validator = Validator::make($request->all(), [
            'providers_id' => 'required',
            'viewdate' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(),'status'=>'0'], $this->successStatus);
        }
        else{ 
                ini_set('memory_limit', '1024M');
			  $Slots=[];
              $Slots['repeat']=null;
              $daywiseData=null;
			  $reciveDate=$request->viewdate;
              $NewreciveDate=str_ireplace('-', '/', $reciveDate); 
			  $covertDate=date("Y-m-d", strtotime($NewreciveDate));
			  $timestamp = strtotime($covertDate);
			  $day = date('D', $timestamp); 
              if($request->set_schedule_check==1){
			  $daywiseData=providerSchedule::select('day_wise')->where(array('providers_id'=>$request->providers_id))->first();
                if($daywiseData){
                     $dataInArray=json_decode($daywiseData->day_wise,true);
                }
             
            
            }else{
                $daywiseData=providerSchedule::select('video_day_wise')->where(array('providers_id'=>$request->providers_id))->first(); 
                 if($daywiseData){
                    $dataInArray=json_decode($daywiseData->video_day_wise,true);
                 }
            }
			  if($daywiseData==null){
                  return response()->json(['message'=>"No Slots Avilable",'status'=>'0']);
			   }
			 
				  

		           $Slots['set_schedule_check']=$request->set_schedule_check;
				   $Slots['date']=$reciveDate;
		           $Slots['providers_id']=$request->providers_id;
                   if($request->set_schedule_check==1){
		        	 $datewiseData=providerSchedule::select('date_wise')->where(array('providers_id'=>$request->providers_id))->first();
                     $dateWiseInArray=json_decode($datewiseData->date_wise,true); 
                 }else{
                    $datewiseData=providerSchedule::select('video_date_wise')->where(array('providers_id'=>$request->providers_id))->first();
                     $dateWiseInArray=json_decode($datewiseData->video_date_wise,true); 
                 }
                 if($dateWiseInArray==null){
                  return response()->json(['message'=>"No Slots Avilable",'status'=>'0']);
               }

					 if(array_key_exists($reciveDate, $dateWiseInArray))
					 { 
						 if($dateWiseInArray[$reciveDate]['morning']['to']!='' && $dateWiseInArray[$reciveDate]['morning']['from']!=''){
							/*$Slots['morning']=$this->getTimeSlot(30,$dateWiseInArray[$reciveDate]['morning']['from'],$dateWiseInArray[$reciveDate]['morning']['to']);*/
						$Slots['morningfrom']=$dateWiseInArray[$reciveDate]['morning']['from'];
							$Slots['morningto']=$dateWiseInArray[$reciveDate]['morning']['to'];
						}else{$Slots['morning']=[];}
						if($dateWiseInArray[$reciveDate]['mid']['to']!='' && $dateWiseInArray[$reciveDate]['mid']['from']!=''){
							/*$Slots['mid']=$this->getTimeSlot(30,$dateWiseInArray[$reciveDate]['mid']['from'],$dateWiseInArray[$reciveDate]['mid']['to']);*/
						$Slots['midfrom']=$dateWiseInArray[$reciveDate]['mid']['from'];
							$Slots['midto']=$dateWiseInArray[$reciveDate]['mid']['to'];
						} else{$Slots['mid']=[];}
						if($dateWiseInArray[$reciveDate]['evening']['to']!='' && $dateWiseInArray[$reciveDate]['evening']['from']!=''){
							/*$Slots['evening']=$this->getTimeSlot(30,$dateWiseInArray[$reciveDate]['evening']['from'],$dateWiseInArray[$reciveDate]['evening']['to']);*/
						$Slots['eveningfrom']=$dateWiseInArray[$reciveDate]['evening']['from'];
							$Slots['eveningto']=$dateWiseInArray[$reciveDate]['evening']['to'];
		                    
						}else{$Slots['evening']=[];} 

						if($dateWiseInArray[$reciveDate]['repeat']!==null){
		                        

		                        $Slots['repeat']=str_replace(str_split('\\/:*?"<>|[]"'), '', $dateWiseInArray[$reciveDate]['repeat']);
		                    }else{
		                            $Slots['repeat']=$dateWiseInArray[$reciveDate]['repeat'];
		                        }

						return response()->json(["status"=>"1","data"=>$Slots]);
					 }else{

                              if($dataInArray[$day]['morning']['to']!='' && $dataInArray[$day]['mid']['to']!='' 
                                    && $dataInArray[$day]['evening']['to']!=''){
                      
                   
                     if($dataInArray[$day]['morning']['to']!='' && $dataInArray[$day]['morning']['from']!=''){ 


                            /*$Slots['morning']=$this->getTimeSlot(30,$dataInArray[$day]['morning']['from'],$dataInArray[$day]['morning']['to']);*/
                            $Slots['morningfrom']=$dataInArray[$day]['morning']['from'];
                            $Slots['morningto']=$dataInArray[$day]['morning']['to'];

                        }else{
                            $Slots['morning']=[];
                        }
                        if($dataInArray[$day]['mid']['to']!='' && $dataInArray[$day]['mid']['from']!=''){
                           /* $Slots['mid']=$this->getTimeSlot(30,$dataInArray[$day]['mid']['from'],$dataInArray[$day]['mid']['to']);*/
                              $Slots['midfrom']=$dataInArray[$day]['mid']['from'];
                            $Slots['midto']=$dataInArray[$day]['mid']['to'];
                        } else{
                            $Slots['mid']=[];
                        }
                        if($dataInArray[$day]['evening']['to']!='' && $dataInArray[$day]['evening']['from']!=''){


                            /*$Slots['evening']=$this->getTimeSlot(30,$dataInArray[$day]['evening']['from'],$dataInArray[$day]['evening']['to']);*/
                            $Slots['eveningfrom']=$dataInArray[$day]['evening']['from'];
                            $Slots['eveningto']=$dataInArray[$day]['evening']['to'];
                        }else{
                            $Slots['evening']=[];
                        }

                        if($request->set_schedule_check==1){

                     $datewiseData=providerSchedule::select('date_wise')->where(array('providers_id'=>$request->providers_id))->first();
                     $dateWiseInArray=json_decode($datewiseData->date_wise,true);
                 }else{
                    $datewiseData=providerSchedule::select('video_date_wise')->where(array('providers_id'=>$request->providers_id))->first();
                     $dateWiseInArray=json_decode($datewiseData->video_date_wise,true);
                 }

                     if(array_key_exists($reciveDate, $dateWiseInArray))
                     { 
                         $Slots['repeat']= str_replace(str_split('\\/:*?"<>|[]"'), '', $dateWiseInArray[$reciveDate]['repeat']);
                             
                      
                     }else{
                            $Slots['repeat']= null;
                     }

                        return response()->json(["status"=>"1","data"=>$Slots]);
						 
					 }else{
                        return response()->json(["status"=>"0","Message"=>"No slot"]);

                     }
					
				  } 
			
		}
	}

     private function getTimeSlot($interval, $start, $end)
{
ini_set('memory_limit', '1024M');
$start = new DateTime($start);

       $end = new DateTime($end);
$start_time = $start->format('H:i'); // Get time Format in Hour and minutes
    $end_time = $end->format('H:i');
    $i=0;
    $time=array();
     $slot=array();
     $values = "";
    while(strtotime($start_time) <= strtotime($end_time)){
        $start = $start_time;
        $end = date('H:i',strtotime('+'.$interval.' minutes',strtotime($start_time)));
        $start_time = date('H:i',strtotime('+'.$interval.' minutes',strtotime($start_time)));
        $i++;
        if(strtotime($start_time) <= strtotime($end_time)){

           $start=date('h:i A', strtotime($start));
           $end=date('h:i A', strtotime($end));
            //$time['slot']=$start.','.$end;
              //$values != "" && $values .= ",";
    $time[] = $start;
    $time[] = $end;
        }
    }
    $txt =array_unique($time);

    foreach($txt as $times)
    {
        $slot[]['slot']=$times;
       
    }

       return $slot;


    
        }
}
