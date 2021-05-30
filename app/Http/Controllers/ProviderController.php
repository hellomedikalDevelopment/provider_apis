<?php

namespace App\Http\Controllers;

use App\Models\Provider;
use App\Models\Providerdetail;
use App\Models\ProviderImage;
use App\Models\Password_reset;
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
                    'status'=>'1',
                    'message'=>'Email Already Exists',
                ]);
            }else{
                $newUser =  new Provider;
                $newUser->provider_type = $request->provider_type;
                $newUser->name = $request->name;
                $newUser->email = $request->email;
                $newUser->phone_no = $request->phone_no;
                $newUser->gender = $request->gender;
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
                        'user_id'=>(String)$existingUser->id,
                        'provider_type'=>$existingUser->provider_type,
                        'name'=>$existingUser->name,
                        'email'=>$existingUser->email,
                        'token'=>$existingUser->remember_token,
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
            return response()->json(['status'=>'1','message'=>'Provider fetched successfully',
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
                'profile_image' => url('/').'/storage/provider_images/'.$existingUser->profile_image,
                // 'details' => $existingUser->detail,
                'images' => $imageArr,
            ]);
        }
        else{
            return response()->json(['message'=>'Unauthorised','status'=>'0'], $this->unauthorised);
        }
    }

    // public function changePassword(Request $request){
    //     $saveArray = $request->all();
    //     $token = $request->header('token');
    //     $existingUser = User::where('remember_token', $token)->first();
    //     $validator = Validator::make($request->all(), [
    //         'old_password' => 'required',
    //         'new_password' => 'required',
    //       ]);
    //       if ($validator->fails()) {
    //         return response()->json(['message'=>$validator->errors()->first(),'status'=>'0'], $this->badrequest);
    //       }
    //       elseif ($request->old_password == $request->new_password) {
    //         return response()->json(['message'=>'New password is same as old password','status'=>'0'], $this->successStatus);
    //       }
    //       else{
    //           if(Hash::check($request->old_password, $existingUser->password)){
    //             $password_en =  Hash::make($request->new_password);
    //             $update = User::where(['id'=>$existingUser->id])->update(['password' => $password_en]);
    //             // echo $update;
    //             if($update){
    //               return response()->json([
    //                     'status'=>'1',
    //                     'message'=>'Password changed Successfully'
    //                   ], $this->successStatus);
    //             }
    //             else{
    //               return response()->json([
    //                     'status'=>'0',
    //                     'message'=>'Error on changing password'
    //                   ], $this->successStatus);
    //             }
    //           }
    //           else{
    //             return response()->json([
    //                 'status'=>'0',
    //                 'message'=>'Old password is incorrect'
    //             ], $this->successStatus);
    //         }
    //     }
    // }

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
}
