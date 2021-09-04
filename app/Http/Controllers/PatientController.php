<?php

namespace App\Http\Controllers;

use App\Models\Patient;
use App\Models\Provider;
use App\Models\Password_reset;
use App\Models\PatientScreenAdds;
use App\Models\Categories;
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

class PatientController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public $unauthorised = 401;
    public $successStatus = 200;
    public $badrequest = 400;

    /**
     * Register new patient
     *
     * @return \Illuminate\Http\Response
     */
    public function register(Request $request) {
        $validator = Validator::make($request->all(), [
            'firstName' => 'required',
            'lastName' => 'required',
            'email' => 'required|email',
            'phoneNo' => 'required',
            'gender' => 'required',
            'age' => 'required|integer',
            'country' => 'required',
            'state' => 'required',
            'city' => 'required',
            'zipcode' => 'required',
            'password' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json(['status'=>'0', 'message'=>$validator->errors()->first()], $this->successStatus);
        }
        else{
            $checkPatient = Patient::where('email',$request->email)->first();
            if($checkPatient){
                return response()->json([
                    'status'=>'0',
                    'message'=>'Email Already Exists',
                ]);
            } else {
                $newUser =  new Patient;
                $newUser->first_name = $request->firstName;
                $newUser->last_name = $request->lastName;
                $newUser->email = $request->email;
                $newUser->phone_no = $request->phoneNo;
                $newUser->gender = $request->gender;
                $newUser->age = $request->age;
                $newUser->country = $request->country;
                $newUser->state = $request->state;
                $newUser->city = $request->city;
                $newUser->zipcode = $request->zipcode;
                $token = (string)mt_rand(100,1000000);
                $token_en = Crypt::encrypt($token);
                $newUser->remember_token = $token_en;
                $newUser->password = Hash::make($request->password);

                /* Save image for user */
                if($request->hasFile('profileImage')){
                    $image = time().$request->profileImage->getClientOriginalName();
                    $request->profileImage->move(public_path('/storage/patients_images') . '/', $image);
                    $newUser->profile_image = $image;
                }
                $newUser->save();

                return response()->json([
                    'status'=>'1',
                    'message'=>'User Registered successfully',
                    'id'=> (String) $newUser->id,
                    'token'=> $token_en
                ], $this->successStatus);
            }
        }
    }

    /**
     * Patient login functionality
     *
     * @return \Illuminate\Http\Response
     */
    public function login(Request $request) {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['status'=>'0', 'message'=>$validator->errors()->first()], $this->successStatus);
        } else {
            $existingUser = Patient::where(array('email' => $request->email, 'account_status' => '1'))->first();
            if ($existingUser) {
                if (Hash::check($request->password , $existingUser['password'])) {
                    if (!$existingUser->is_login) {
                        $updateLogin = Patient::where('id', $existingUser->id)->update(array('is_login' => 1));
                        return response()->json([
                            'status' => '1',
                            'message'=>'Logged in successfully',
                            'token'=>$existingUser->remember_token,
                            'data'=>$existingUser,
                        ], $this->successStatus);
                    } else {
                        return response()->json([
                            'status'=>'0',
                            'message'=>'User already logged in',
                            'token'=>$existingUser->remember_token,
                            'data'=>$existingUser,
                        ], $this->successStatus);
                    }
                } else {
                  return response()->json(['status'=>'0', 'message'=>'Email or Password is incorrect'], $this->successStatus);
                }
            } else {
                return response()->json(['status'=>'0', 'message'=>'User not found'], $this->successStatus);
            }
        }
    }

    /**
     * Patient logout functionality
     *
     * @return \Illuminate\Http\Response
     */
    public function logout(Request $request) {
        $validator = Validator::make($request->all(), [
            'patientId' => 'required|integer'
        ]);
        if ($validator->fails()) {
            return response()->json(['status'=>'0', 'message'=>$validator->errors()->first()], $this->successStatus);
        } else {
            $checkUser = Patient::where(array('id' => $request->patientId, 'is_login' => 1))->first();
            if ($checkUser) {
                $updateLogin = Patient::where('id', $request->patientId)->update(array('is_login' => 0));
                return response()->json([
                    'status' => '1',
                    'message'=>'User logged out successfully'
                ], $this->successStatus);
            } else {
                return response()->json(['status'=>'0', 'message'=>'User already logged out'], $this->successStatus);
              }
        }
    }

    /**
     * Update patient details
     *
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request) {
        $saveArray = $request->all();
        $validator = Validator::make($request->all(), [
            'patientId' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json(['status'=>'0', 'message'=>$validator->errors()->first()], $this->successStatus);
        }
        else{
            $userExist = Patient::where('id',$saveArray['patientId'])->first();
            if($userExist) {
                if($request->hasFile('profileImage')) {
                    $image = time().$request->profileImage->getClientOriginalName();
                    $request->profileImage->move(public_path('/storage/patients_images') . '/', $image);
                } else {
                    $image = $userExist['profile_image'];
                }
                
                $updateProfile = [
                    'first_name' => $saveArray['firstName'] ?? $userExist['first_name'],
                    'last_name' => $saveArray['lastName'] ?? $userExist['last_name'],
                    'gender' => $saveArray['gender'] ?? $userExist['gender'],
                    'age' => $saveArray['age'] ?? $userExist['age'],
                    'phone_no' => $saveArray['phoneNo'] ?? $userExist['phone_no'],
                    'country' => $saveArray['country'] ?? $userExist['country'],
                    'state' => $saveArray['state'] ?? $userExist['state'],
                    'city' => $saveArray['city'] ?? $userExist['city'],
                    'zipcode' => $saveArray['zipcode'] ?? $userExist['zipcode'],
                    'profile_image' => $image,
                    'updated_at'=>date('Y-m-d h:i:s')
                ];
                $update = Patient::where('id', $saveArray['patientId'])->update($updateProfile);
                return response()->json(['status'=>'1','message'=>'Profile Updated',
            ], $this->successStatus);
            } else {
                return response()->json(['status'=>'0','message'=>'Patient Not Found',
                ], $this->successStatus);
            }
        }
    }

    /**
     * Patient forget password functionality sending OTP
     *
     * @return \Illuminate\Http\Response
     */
    public function forgotPassword(Request $request) {
        $saveArray = $request->all();
        $validator = Validator::make($request->all(), [
            'email' => 'required|email'
        ]);
        if ($validator->fails()) {
            return response()->json(['status'=>'0', 'message'=>$validator->errors()->first()], $this->successStatus);
        } else {
            $email = $saveArray['email'];
            if (Patient::where('email', '=', $email)->count() > 0) {
                $checkRest = Password_reset::where('email', '=', $email)->first();
                $otp = rand (1000 , 9999);
                if (empty($checkRest)) {
                    $userDetail =  new Password_reset;
                    $userDetail->otp = $otp;
                    $userDetail->email = $request->email;
                    $userDetail->save();
                } else {
                    $updateOtp = [
                        'otp' => $otp,
                        'updated_at' => date('Y-m-d h:i:s')
                    ];
                    $update = Password_reset::where(['email'=>$email])->update($updateOtp);
                }
                $msg = [
                    "name" => $email,
                    "new_password" => $otp
                ];
                Mail::send('mail', $msg, function($message) use ($email) {
                    $message->to($email);
                    $message->subject('Forgot Password');
                });
                return response()->json(['status' =>'1' ,'message'=>'OTP has been sent to your email','otp'=>$otp], $this->successStatus);
            } else {
                return response()->json(['status' =>'error' ,'message'=>'Unauthorised'], 401);
            }
        }
    }

    /**
     * Patient password updation after forgotting password
     *
     * @return \Illuminate\Http\Response
     */
    public function newPassword(Request $request) {
        $saveArray = $request->all();
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'newPassword' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json(['status'=>'0', 'message'=>$validator->errors()->first()], $this->successStatus);
        }
        else{
            $updatePassword = [
                'password' => Hash::make($request->newPassword),
                'updated_at' => date('Y-m-d h:i:s')
            ];
            $update = Patient::where(['email'=>$saveArray['email']])->update($updatePassword);
            return response()->json(['status' =>'1' ,'message'=>'Password Updated Successfully'], $this->successStatus);
        }
    }

    /**
     * Change password functionality
     *
     * @return \Illuminate\Http\Response
     */
    public function changePassword(Request $request) {
         $validator = Validator::make($request->all(), [
            'patientId' => 'required|integer',
            'oldPassword' => 'required',
            'newPassword' => 'required',            
            'confirmPassword' => 'required|same:newPassword',
            ]);
        if ($validator->fails()) {
            return response()->json(['status'=>'0', 'message'=>$validator->errors()->first()], $this->successStatus);
        }
        else{
            $user_id = $request->patientId;
            $old_pass = $request->oldPassword;
            $new_pass = $request->newPassword;
            $user_data = Patient::select('id','password')->where(['id'=>$user_id])->first();    
            if(empty($user_data)) {
                return response()->json([ 'status' => '0','message' => "Sorry, This patient does not exist."]);           
            } else if(Hash::check($old_pass,$user_data->password)!=1) {
                return response()->json([ 'status' => '0','message' => "Sorry, Old password does not match."]);          
            }
            Patient::where('id',$user_data->id)->update(['password'=>Hash::make($new_pass)]);         
            $msg = [ 'status' => '1','message' => "Password reset successfully."];     
            return response()->json($msg);
        }
    }

    /**
     * Patient delete account functionality
     *
     * @return \Illuminate\Http\Response
     */
    public function deleteAccount(Request $request) {
        $validator = Validator::make($request->all(), [
            'whyLeaveUs' => 'required',
            'patientId' => 'required|integer',
            'password' => 'required',            
            'retypePassword' => 'required|same:password',
            'status' => 'required|integer',

        ]);
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(),'status'=>'0'], $this->successStatus);
        }
        else {
            $user_data = Patient::select('id','password','email')->where(['id'=> $request->patientId])->first();    
            if(empty($user_data)) {
                return response()->json([ 'status' => '0','message' => "Sorry, This patient does not exist."]);           
            } else if (Hash::check($request->password,$user_data->password)!=1) {
                return response()->json([ 'status' => '0','message' => "Sorry, password is wrong."]);          
            } else {
                $email=$user_data->email;
                $msg = array('status' => '1');
                if($request->status == 2) {
                    Patient::where('id', $user_data->id)->update(['account_status' => '0']);      
                    $msg['message'] = "Account Deactivate successfully."; 
                    $newsage = [
                        "leaveus" => $request->why_leave_us,
                        "newmessage" => "Your Account Deactivate"
                    ];
                     Mail::send('deleteaccount', $newsage, function($message) use ($email) {
                     $message->to($email);
                     $message->subject('Deactivate Account');
                 });
                } else if($request->status == 1) {
                    Patient::where('id', $user_data->id)->delete();   
                    $msg['message'] = "Account Delete successfully.";
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

    /**
     * Show adds on patient dashboard
     *
     * @return \Illuminate\Http\Response
     */
    public function showAdds(Request $request) {
        $patientAdds = PatientScreenAdds::select('id', 'name', 'image')->get();
        if ($patientAdds) {
            return response()->json([
                'status'=>'0',
                'message'=>'Home screen adds',
                'data'=>$patientAdds,
            ], $this->successStatus);
        } else {
            return response()->json(['status'=>'0', 'message'=>'Adds not found'], $this->successStatus);
        }
    }

    /**
     * Show popular categories
     *
     * @return \Illuminate\Http\Response
     */
    public function popularCategories(Request $request) {
        $categories = Categories::select('id', 'name', 'icon')->get();
        if ($categories) {
            return response()->json([
                'status'=>'0',
                'message'=>'Categories',
                'data'=>$categories,
            ], $this->successStatus);
        } else {
            return response()->json(['status'=>'0', 'message'=>'No categories found'], $this->successStatus);
        }
    }

    /**
     * Search Clinic or Doctor
     *
     * @return \Illuminate\Http\Response
     */
    public function searchClinicorDoctor(Request $request) {
        $validator = Validator::make($request->all(), [
            'search' => 'required|string|in:Doctor,Clinic'
        ]);
        if ($validator->fails()) {
            return response()->json(['status'=>'0', 'message'=>$validator->errors()->first()], $this->successStatus);
        } else {
            $provider_type = '1';
            if ($request->search == 'Clinic') {
                $provider_type = '2';
            }
            $clinic_or_doctor = Provider::where('provider_type', $provider_type);
            if ($request->country) {
                $clinic_or_doctor = $clinic_or_doctor->where('country', $request->country);
            }
            if ($request->state) {
                $clinic_or_doctor = $clinic_or_doctor->where('state', $request->state);
            }
            if ($request->city) {
                $clinic_or_doctor = $clinic_or_doctor->where('town_city', $request->city);
            }
            if ($request->speciality) {
                $clinic_or_doctor = $clinic_or_doctor->where('specialization', $request->speciality);
            }
            if ($request->keyword) {
                $keyword = $request->keyword;
                $clinic_or_doctor =  $clinic_or_doctor->where(function($query) use ($keyword){
                    $query->where('specialization', 'like', '%' . $keyword . '%')
                        ->orWhere('name', 'like', '%' . $keyword . '%');
                });
            }
            if ($request->availability) {
                $clinic_or_doctor = $clinic_or_doctor->leftJoin('provider_sheduals','provider_sheduals.providers_id','=','providers.id')
                                    ->select('providers.*','provider_sheduals.day_wise');
            }
            $clinic_or_doctor = $clinic_or_doctor->get();
            if ($request->availability  && !empty($clinic_or_doctor)) {
                $clinic_or_doctor = $this->checkAvailability($request->availability, $clinic_or_doctor);
            }
            if ($clinic_or_doctor->isNotEmpty()) {
                return response()->json([
                    'status'=>'0',
                    'message'=>'Search clinic or doctor',
                    'data'=>$clinic_or_doctor,
                ], $this->successStatus);
            } else {
                return response()->json(['status'=>'0', 'message'=>'No data found'], $this->successStatus);
            }
        }
    }


    /**
     * Check availability of clinics and doctors
     *
     * @return \Illuminate\Http\Response
     */
    public function checkAvailability($availability, $clinic_or_doctor) {
        $today_day = Carbon::now()->format('D');
        $availability_break = explode(' to ', $availability);
        $availability_from_time = strtotime($availability_break[0]);
        $availability_to_time = strtotime($availability_break[1]);
        foreach ($clinic_or_doctor as $key => $individual) {
            if (!empty($individual->day_wise)) {
                $day_wise = json_decode($individual->day_wise);
                if(!empty($day_wise)) {
                    foreach ($day_wise as $day_data) {
                        if (!empty($day_data->person) && !empty($day_data->person->timing) && !empty($day_data->person->timing->$today_day)) {
                            $today_schedule = $day_data->person->timing->$today_day;
                            $timing_match = 0;
                            foreach ($today_schedule as $timings) {
                                if ($availability_from_time >= strtotime($timings->from)
                                    && $availability_from_time < strtotime($timings->to) 
                                    && $availability_to_time >= strtotime($timings->from)
                                    && $availability_to_time <= strtotime($timings->to))
                                    {
                                        $timing_match = 1;
                                    }
                            }
                            if (!$timing_match) {
                                $clinic_or_doctor->forget($key);    
                            }
                        } else {
                            $clinic_or_doctor->forget($key);
                        }
                    }
                } else {
                    $clinic_or_doctor->forget($key);    
                }
            } else {
                $clinic_or_doctor->forget($key);
            }
        }
        return $clinic_or_doctor;
    }

    public function deleteProviderProfileImages(Request $request) {
        $validator = Validator::make($request->all(), [
            'providers_id' => 'required'
            
        ]);
        if($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(),'status'=>'0'], 400);
        } else {
                $affected = DB::table('providers')->where('id', $request->providers_id)->update(['profile_image' =>'']);
                if($affected) {
                    return response()->json(['status'=>'1','message'=>'Profile Updated',], 200);
                } else {
                    return response()->json(['message'=>"opration fail",'status'=>'0'], 200);
                }
        }    
    }

    public function otpMail($email, $otp) {
        $name = 'Dear '.$email.' ';
        $email = $email;
        $title = 'OTP for Email Verification';
        $content = 'Here is the otp of your email varification : '.$otp.'';
        \Mail::send('contactUsMail', [
            'name' => $name, 
            'email' => $email, 
            'title' => $title,
            'content' => $content
        ], function ($message) use ($email) {
            $message->to($email)->subject('Verification Mail');
        });
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

    private function calculate_profile($profile) {
        if(!$profile) {
            return 0;
        }
        $columns    = preg_grep('/(.+ed_at)|(.*id)/', array_keys($profile->toArray()), PREG_GREP_INVERT);
        $per_column = 100 / count($columns);
        $total      = 0;
        foreach($profile->toArray() as $key => $value) {
            if($value !== NULL && $value !== [] && in_array($key, $columns)) {
                $total += $per_column;
            }
        }
        return $total;
    }

    public function randomPassword($length = 8) {
      $characters = '23456789abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ';
      $charactersLength = strlen($characters);
      $randomString = '';
      for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
      }
      return $randomString;
    }
}
