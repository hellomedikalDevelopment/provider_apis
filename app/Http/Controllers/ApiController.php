<?php

namespace App\Http\Controllers;

// use Kreait\Firebase\Factory;
//use Kreait\Firebase\ServiceAccount;
//use Kreait\Firebase\Database;
use Illuminate\Http\Request;
use App\Models\Provider;
use App\Models\User;
use App\Models\Country;
use App\Models\State;
use App\Models\City;
use App\Models\customerSupport;
use App\Models\Review;
use App\Models\Slots;
use App\Models\Appointment;
use App\Models\Timeslot;


use Validator;
use Illuminate\Support\Facades\Hash;

use DB;

class ApiController extends Controller
{

    protected $database;
    public $unauthorised = 401;
    public $successStatus = 200;
    public $badrequest = 400;


/**************************************************************************/

    // public function __construct()
    // {
    //     $this->database = (new Factory)
    //     ->withServiceAccount(__DIR__.'/tryproject-2ac32-firebase-adminsdk-8e8q5-f520676e3c.json')
    //     ->withDatabaseUri('https://the-active-intro-2021-default-rtdb.firebaseio.com/')
    //     ->createDatabase();
    // }

/**************************************************************************/


    public function save(Request $request){

        $input = $request->all();
        $table = $request->table_name;

        $result = $this->database->getReference($table)->push($input);

        return response()->json(['status' => 1,'result' => $result]);

    }

/**************************************************************************/


    public function getAll(Request $request){

        $input = $request->all();
        $table = $request->table_name;

        $result = $this->database->getReference($table)->getSnapshot()->getValue();

        return response()->json(['status' => 1,'result' => $result]);

    }

/**************************************************************************/

    public function getSingle(Request $request){

        $input = $request->all();
        $table = $request->table_name;

        $uid = $request->uid;
        $result = $this->database->getReference($table."/".$uid)->getValue();

        return response()->json(['status' => 1,'result' => $result]);

    }

/**************************************************************************/

    public function update(Request $request){

        $input = $request->all();
        $table = $request->table_name;

        $uid = $request->uid;
        $result = $this->database->getReference($table."/".$uid)->update($input);

        return response()->json(['status' => 1,'result' => $result]);

    }


 /**************************************************************************/

    public function delete(Request $request){

        $input = $request->all();
        $table = $request->table_name;

        $uid = $request->uid;
        $result = $this->database->getReference($table."/".$uid)->remove();

        return response()->json(['status' => 1,'result' => $result]);

    }

/**************************************************************************/

    public function upload(Request $request){

        /*$storage = (new Factory())
        ->withServiceAccount(__DIR__.'/tryproject-2ac32-firebase-adminsdk-8e8q5-f520676e3c.json')
        ->withDefaultStorageBucket('the-active-intro-2021.appspot.com')
        ->createStorage();

        $input = $request->all();
        $table = $request->table_name;

        $uid = $request->uid;
        $result = $this->database->getReference($table."/".$uid)->getValue();

        return response()->json(['status' => 1,'result' => $result]); */



        $path = $request->file('avatar')->store('avatars');

        return $path;

    }

/**************************************************************************/

    public function getSubscriptions(Request $request){

        $input = $request->all();
        $table = $request->table_name;

        //$data = $this->database->getReference('items')->getValue();
        //$table = 'items/';

        $result = $this->database->getReference($table)
        //->orderByChild('title')->equalTo('2')
        //->orderByChild('title')
        //->limitToFirst(2)
        ->getSnapshot()->getValue();

        //Get Record By Id
        //$uid = '-MZI7GABMVvxsRTR1Ohk';
        //$data = $this->database->getReference($table."/".$uid)->getValue();

        // Update Data
        $uid = '-MZI7GABMVvxsRTR1Ohk';
        $data = array (
            'title' => 'Post title8',
            'body' => 'This should probably bes longer8.'
        );

        //$data1 = $this->database->getReference($table."/".$uid)->update($data);

        $this->database->getReference($table)->push($input);

        // Delete Data
        //$reference = $this->database->getReference($table."/".$uid)->remove();

        //$reference = $database->getReference('contact')->OrderByChild("email")->EqualTo("abcd@mail.com")->getValue();

        //print_R($reference);die;
        // Update Data
        //$reference = $database->getReference($table."/".$uid)->update($data);

        return response()->json(['status' => 1,'result' => $result]);

    }



/**************************************************************************/


    public function register(Request $request){

        $validator = Validator::make($request->all(), [
            'first_name' => 'required',
            'last_name' => 'required',
            'email' => 'required',
            'phone_no' => 'required',
            'age' => 'required',
            'gender' => 'required',
            'country' => 'required',
            'state' => 'required',
            'city' => 'required',
            'zip' => 'required',
            'password' => 'required',
            //'device_type' => 'required',
            //'device_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 0,'message'=>"All fields are required"]);
        }

        $checkEmail = User::where(['email'=>$request->email])->first();

        if($checkEmail){
             return response()->json(['status' => 0,'message'=>'Email already exist.']);
        }

        $checkPhone = User::where(['phone_no'=>$request->phone_no])->first();

        if($checkPhone){
             return response()->json(['status' => 0,'message'=>'Phone No already exist.']);
        }


        if ($request->hasFile('image')) {

            if ($request->file('image')->isValid()) {

               /* $validated = $request->validate([

                    'image' => 'mimes:jpeg,png|max:1014',

                ]);*/

                //$extension = $request->image->extension();
                //$image_name = time().".".$extension;
                //$request->image->storeAs('/images', $image_name);

                  $image_name = time().'.'.$request->image->extension();

                $request->image->move(public_path('images'), $image_name);

            }else{
                $image_name ="default.png";
            }

        }else{
            $image_name ="default.png";
        }


        $data = array(

            'first_name'=>$request->first_name,
            'last_name'=>$request->last_name,
            'email'=>$request->email,
            'phone_no'=>$request->phone_no,
            'age'=>$request->age,
            'gender'=>$request->gender,
            'country'=>$request->country,
            'state'=>$request->state,
            'city'=>$request->city,
            'zip'=>$request->zip,
            'password'=>Hash::make($request->password),
            'orignal_password'=>$request->password,
            'image'=>$image_name,
            'name'=>$request->first_name.' '.$request->last_name,
            'otp'=> rand(1111,9999),
            'is_admin'=>1,
            'is_active'=>1,

            );


        $users = User::create($data);
        $url = url('public/images');
        $user = User::where(['id'=>$users->id])->select(array('*', DB::raw("CONCAT('$url/', image) AS image")))->first();

        $data['id'] =  $users->id;


        return response()->json(['status' => 1,'message' => 'Registered Successfully.','result' =>$user]);

    }

/**************************************************************************/

    public function login(Request $request){

        $validator = Validator::make($request->all(), [
            'email' => 'required',
            'password' => 'required',
            //'device_type' => 'required',
            //'device_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 0,'message'=>"All fields are required"]);
        }
        $url = url('public/images');
        $checkEmail = User::where(['email'=>$request->email,'is_active'=>1])->select(array('*', DB::raw("CONCAT('$url/', image) AS image")))->first();
        if ($request->activate_account == 'true') {
            $update = User::where(['email'=>$request->email])->select(array('*', DB::raw("CONCAT('$url/', image) AS image")))->first();
            if (Hash::check($request->password, $update['password']))
            {
                $activateAccount = User::where(['email'=>$request->email])
                ->update(['is_active'=>'1']);
                return response()->json(['status' => 1,'message' => 'Login Successfully.','result' => $update]);
            }else{
                return response()->json(['status' => 0,'message'=>'Password Mismatched']);
            }
        }
        if($checkEmail){

            if (Hash::check($request->password, $checkEmail->password))
            {
                return response()->json(['status' => 1,'message' => 'Login Successfully.','result' => $checkEmail]);
            }else{
                return response()->json(['status' => 0,'message'=>'Password Mismatched']);
            }
        }else{
            return response()->json(['status' => 0,'message'=>'Account Not Registered or Deactivated Please contact support for more information.']);
        }


    }

/**************************************************************************/


    public function changePassword(Request $request){

        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'password' => 'required',
            'cpassword' => 'required',

        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 0,'message'=>"All fields are required"]);
        }

        $user = User::where(['id'=>$request->user_id])->first();

        if(!$user){
            return response()->json(['status' => 0,'message'=>'Invalid user id']);
        }

        if ($request->password  != $request->cpassword)
        {
            return response()->json(['status' => 0,'message'=>'Password Mismatch']);
        }

        User::where('id', $request->user_id)->update([
           'password' => Hash::make($request->password),
           'orignal_password' => $request->password,
        ]);

        return response()->json(['status' => 1,'message' => 'Changed Successfully.']);


    }


/**************************************************************************/


    public function resendOtp(Request $request){

        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 0,'message'=>"All fields are required"]);
        }

        $user = User::where(['id'=>$request->user_id])->first();

        if(!$user){
            return response()->json(['status' => 0,'message'=>'Invalid user id']);
        }


        $otp  = rand(1111,9999);

        User::where('id', $request->user_id)->update([
           'otp' => $otp
        ]);

       $result = ['otp'=>$otp];

        return response()->json(['status' => 1,'message' => 'OTP sent to your email.','result' => $result]);


    }


/**************************************************************************/


    public function verifyOtp(Request $request){

        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'otp' => 'required',

        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 0,'message'=>"All fields are required"]);
        }

        $user = User::where(['id'=>$request->user_id,'otp'=>$request->otp])->first();

        if(!$user){
            return response()->json(['status' => 0,'message'=>'Invalid OTP']);
        }

        User::where('id', $request->user_id)->update([
           'is_active' => 2
        ]);

        return response()->json(['status' => 1,'message' => 'Verified Successfully.']);

    }

/**************************************************************************/

    public function editProfile(Request $request){

         $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'first_name' => 'required',
            'last_name' => 'required',
            'email' => 'required',
            'phone_no' => 'required',
            'age' => 'required',
            'gender' => 'required',
            'country' => 'required',
            'state' => 'required',
            'city' => 'required',
            'zip' => 'required',
            //'device_type' => 'required',
            //'device_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 0,'message'=>"All fields are required"]);
        }

        $user = User::where(['id'=>$request->user_id])->first();

        if(!$user){
            return response()->json(['status' => 0,'message'=>'Invalid user id']);
        }

        if ($request->hasFile('image')) {

            if ($request->file('image')->isValid()) {

               /* $validated = $request->validate([

                    'image' => 'mimes:jpeg,png|max:1014',

                ]);*/

                //$extension = $request->image->extension();
                //$image_name = time().".".$extension;
                //$request->image->storeAs('/images', $image_name);

                $image_name = time().'.'.$request->image->extension();

                $request->image->move(public_path('images'), $image_name);

            }else{
                $image_name = $user->image;
            }

        }else{
            $image_name = $user->image;
        }


        $data = array(

            'first_name'=>$request->first_name,
            'last_name'=>$request->last_name,
            'email'=>$request->email,
            'phone_no'=>$request->phone_no,
            'age'=>$request->age,
            'gender'=>$request->gender,
            'country'=>$request->country,
            'state'=>$request->state,
            'city'=>$request->city,
            'zip'=>$request->zip,
            //'password'=>Hash::make($request->password),
            //'orignal_password'=>$request->password,
            'image'=>$image_name,
            'name'=>$request->first_name.' '.$request->last_name,
            //'otp'=> rand(1111,9999),
            //'is_admin'=>1,
            //'is_active'=>1,

        );

         User::where('id', $request->user_id)->update($data);

        return response()->json(['status' => 1,'message' => 'Updated Successfully.']);

    }

/**************************************************************************/


    public function changePassword2(Request $request){

       $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'old_password' => 'required',
            'password' => 'required',
            'cpassword' => 'required',

        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 0,'message'=>"All fields are required"]);
        }

        $user = User::where(['id'=>$request->user_id])->first();

        if(!$user){
            return response()->json(['status' => 0,'message'=>'Invalid user id']);
        }

        if ($request->password  != $request->cpassword)
        {
            return response()->json(['status' => 0,'message'=>'Password Mismatch']);
        }

        if (Hash::check($request->old_password, $user->password))
        {
            User::where('id', $request->user_id)->update([
               'password' => Hash::make($request->password),
               'orignal_password' => $request->password,
            ]);

            return response()->json(['status' => 1,'message' => 'Changed Successfully.']);


        }else{
             return response()->json(['status' => 0,'message'=>'Invalid Old Password']);
        }




    }

/**************************************************************************/


    public function changeLanguage(Request $request){

        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'language' => 'required',

        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 0,'message'=>"All fields are required"]);
        }

        $user = User::where(['id'=>$request->user_id])->first();

        if(!$user){
            return response()->json(['status' => 0,'message'=>'Invalid user id']);
        }

        User::where('id', $request->user_id)->update([
           'language' => $request->language
        ]);

        return response()->json(['status' => 1,'message' => 'Changed Successfully.']);

    }

/**************************************************************************/

    public function customerSupport(Request $request){

        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'name' => 'required',
            'email' => 'required',
            'phone_no' => 'required',
            'subject' => 'required',
            'message' => 'required',
            //'image' => 'required',

        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 0,'message'=>"All fields are required"]);
        }

        if ($request->hasFile('image')) {

            if ($request->file('image')->isValid()) {

               /* $validated = $request->validate([

                    'image' => 'mimes:jpeg,png|max:1014',

                ]);*/


                //$extension = $request->image->extension();
                //$image_name = time().".".$extension;
                //print_R($image_name);die;
                //$request->image->storeAs('/images', $image_name);
                //$request['image1'] = $image_name;

                $image_name = time().'.'.$request->image->extension();
                $request->image->move(public_path('images'), $image_name);

            }else{
                $request['image1'] = "default.png";
            }

        }else{
            $request['image1'] = "default.png";
        }


        customerSupport::create($request->all());

        return response()->json(['status' => 1,'message' => 'Added Successfully.']);

    }

/**************************************************************************/

    public function deactivateAccount(Request $request){
        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'password' => 'required',
            'type' => 'required'
        ]);
        if ($validator->fails()) {
                return response()->json(['status' => 0,'message'=>"All fields are required"]);
        }else{
            $user = User::where(['id'=>$request->user_id])->first();

            if(!$user){
                return response()->json(['status' => 0,'message'=>'Invalid user id']);
            }

            if ($request->type === '1') {
                if (Hash::check($request->password, $user->password))
                    {
                        User::where('id', $request->user_id)->delete();

                        return response()->json(['status' => 1,'message' => 'Deleted Successfully.']);

                    }else{
                         return response()->json(['status' => 0,'message'=>'Invalid Old Password']);
                    }
            }elseif ($request->type === '2'){
                if (Hash::check($request->password, $user->password))
                {
                    User::where('id', $request->user_id)->update(['is_active'=>'2']);

                    return response()->json(['status' => 1,'message' => 'Deactivated Successfully.']);

                }else{
                     return response()->json(['status' => 0,'message'=>'Invalid Old Password']);
                }
            }
        }

    }

/**************************************************************************/

    public function getProfile(Request $request){

         $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            //'device_type' => 'required',
            //'device_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 0,'message'=>"All fields are required"]);
        }


        $url = url('/images');

        $user = User::where(['id'=>$request->user_id])->select(array('*', DB::raw("CONCAT('$url/', image) AS image")))->first();

        //$user = User::where(['id'=>$request->user_id])->first();

        if(!$user){
            return response()->json(['status' => 0,'message'=>'Invalid user id']);
        }

        return response()->json(['status' => 1,'message' => 'Success','result'=>$user]);

    }

/**************************************************************************/

    public function forgotPassword(Request $request){

        $validator = Validator::make($request->all(), [
            'email' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 0,'message'=>"All fields are required"]);
        }

        $user = User::where(['email'=>$request->email])->first();

        if(!$user){
            return response()->json(['status' => 0,'message'=>'Invalid email id']);
        }

        $password = rand(111111,999999);

        User::where('email', $request->email)->update([
           'password' => Hash::make($password),
           'orignal_password' => $password,
        ]);

        $result = ['password'=>$password];

        return response()->json(['status' => 1,'message' => 'Changed Successfully.','result'=>$result]);


    }


/**************************************************************************/

public function forgotPassword2(Request $request){

    $validator = Validator::make($request->all(), [
        'email' => 'required',
    ]);

    if ($validator->fails()) {
        return response()->json(['status' => 0,'message'=>"All fields are required"]);
    }

    $user = User::where(['email'=>$request->email])->first();

    if(!$user){
        return response()->json(['status' => 0,'message'=>'Invalid email id']);
    }

    $otp = rand(1111,9999);

    User::where('email', $request->email)->update([
       'otp' => $otp,
    ]);

    $result = ['otp'=>$otp];

    return response()->json(['status' => 1,'message' => 'OTP sent to your email.','result'=>$result]);


}


/**************************************************************************/

public function resendOtp2(Request $request){

    $validator = Validator::make($request->all(), [
        'email' => 'required',
    ]);

    if ($validator->fails()) {
        return response()->json(['status' => 0,'message'=>"All fields are required"]);
    }

    $user = User::where(['email'=>$request->email])->first();

    if(!$user){
        return response()->json(['status' => 0,'message'=>'Invalid email id']);
    }



    $otp  = rand(1111,9999);

    User::where('email', $request->email)->update([
       'otp' => $otp
    ]);

   $result = ['otp'=>$otp];

    return response()->json(['status' => 1,'message' => 'OTP sent to your email.','result' => $result]);


}


/**************************************************************************/


public function verifyOtp2(Request $request){

    $validator = Validator::make($request->all(), [
        'email' => 'required',
        'otp' => 'required',

    ]);

    if ($validator->fails()) {
        return response()->json(['status' => 0,'message'=>"All fields are required"]);
    }

    $user = User::where(['email'=>$request->email,'otp'=>$request->otp])->first();

    if(!$user){
        return response()->json(['status' => 0,'message'=>'Invalid OTP']);
    }

    User::where('email', $request->email)->update([
       'is_active' => 2
    ]);

    return response()->json(['status' => 1,'message' => 'Verified Successfully.']);

}

/**************************************************************************/


    public function changePassword3(Request $request){

        $validator = Validator::make($request->all(), [
            'email' => 'required',
            'password' => 'required',
            'cpassword' => 'required',

        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 0,'message'=>"All fields are required"]);
        }

        $user = User::where(['email'=>$request->email])->first();

        if(!$user){
            return response()->json(['status' => 0,'message'=>'Invalid email id']);
        }

        if ($request->password  != $request->cpassword)
        {
            return response()->json(['status' => 0,'message'=>'Password Mismatch']);
        }

        User::where('email', $request->email)->update([
           'password' => Hash::make($request->password),
           'orignal_password' => $request->password,
        ]);

        return response()->json(['status' => 1,'message' => 'Changed Successfully.']);


    }

/**************************************************************************/


public function addCountry(Request $request){

    $validator = Validator::make($request->all(), [
        'name' => 'required',
    ]);

    if ($validator->fails()) {
        return response()->json(['status' => 0,'message'=>"All fields are required"]);
    }

    $country = Country::where(['name'=>$request->name])->first();

    if($country){
        return response()->json(['status' => 0,'message'=>'Country Already Added']);
    }

    $data = array(
        'name'=>$request->name,
    );


    $country = Country::create($data);

    return response()->json(['status' => 1,'message' => 'Added Successfully.']);

}

/**************************************************************************/


public function getCountries(Request $request){

   $countries = Country::all();
   return response()->json(['status' => 1,'message' => 'Success','result'=>$countries]);

}

/**************************************************************************/

public function addState(Request $request){

    $validator = Validator::make($request->all(), [
        'country_id' => 'required',
        'name' => 'required',
    ]);

    if ($validator->fails()) {
        return response()->json(['status' => 0,'message'=>"All fields are required"]);
    }

    $state = State::where(['country_id'=>$request->country_id,'name'=>$request->name])->first();

    if($state){
        return response()->json(['status' => 0,'message'=>'State Already Added']);
    }

    $data = array(
        'country_id'=>$request->country_id,
        'name'=>$request->name,
    );


    $state = State::create($data);

    return response()->json(['status' => 1,'message' => 'Added Successfully.']);

}

/**************************************************************************/


public function getStates(Request $request){

   $states = State::all();
   return response()->json(['status' => 1,'message' => 'Success','result'=>$states]);

}

/**************************************************************************/

public function addCity(Request $request){

    $validator = Validator::make($request->all(), [
        'state_id' => 'required',
        'name' => 'required',
    ]);

    if ($validator->fails()) {
        return response()->json(['status' => 0,'message'=>"All fields are required"]);
    }

    $city = City::where(['state_id'=>$request->state_id,'name'=>$request->name])->first();

    if($city){
        return response()->json(['status' => 0,'message'=>'City Already Added']);
    }

    $data = array(
        'state_id'=>$request->state_id,
        'name'=>$request->name,
    );


    $city = City::create($data);

    return response()->json(['status' => 1,'message' => 'Added Successfully.']);

}

/**************************************************************************/


public function getCities(Request $request){

   $cities = City::all();
   return response()->json(['status' => 1,'message' => 'Success','result'=>$cities]);

}

/**************************************************************************/

function getTimeSlot($interval, $start, $end){
    $start = new DateTime($start);
    $end = new DateTime($end);
    $start_time = $start->format('H:i'); // Get time Format in Hour and minutes
    $end_time = $end->format('H:i');
    $i=0;
    // print_r($start_time);die();
    while(strtotime($start_time) <= strtotime($end_time)){
        // print_r("dd");die();
        $start = $start_time;
        $end = date('H:i',strtotime('+'.$interval.' minutes',strtotime($start_time)));
        $start_time = date('H:i',strtotime('+'.$interval.' minutes',strtotime($start_time)));
        $i++;
        if(strtotime($start_time) <= strtotime($end_time)){
            $time[$i]['start'] = $start;
            $time[$i]['end'] = $end;
        }
    }
    return $time;
}

public function bookAppointment(Request $request){
        $validator = Validator::make($request->all(), [
            'entity_id' => 'required',
            'user_id' => 'required',
            'date' => 'required',
            'time' => 'required',
            'payment' => 'required',
            'tax' => 'required',
            'total' => 'required',
            'is_new_customer' => 'required',
            'has_qurantine' => 'required',
            'phone_number' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(),'status'=>'false'], $this->badrequest);
        }else{
            $checkUser = User::where('id',$request->user_id)->first();
            if ($checkUser) {
                $checkSlot = Slots::where('entity_id',$request->entity_id)
                ->where('start_time',$request->start_time)
                ->where('end_time',$request->end_time)
                ->where('date',$request->date)
                ->where('user_id',$request->user_id)
                ->where('status','1')
                // ->orWhere('status','3')
                ->first();
                if ($checkSlot) {
                    return response()->json(['status'=>'true','message'=>'Slot Already Booked'], $this->badrequest);
                }else{
                    $space = ' ';
                    $data['user_id'] = $request->user_id;
                    $data['entity_id'] = $request->entity_id;
                    $data['payment_amount'] = $request->payment;
                    $data['tax'] = $request->tax;
                    $data['total'] = $request->total;
                    $data['payment_status'] = 1;
                    $data['has_qurantine'] = $request->has_qurantine;
                    $data['is_new_customer'] = $request->is_new_customer;
                    $data['date'] = $request->date;
                    $data['datetime'] = $request->date.$space.$request->start_time;
                    $data['phone_number'] = $request->phone_number;
                    $data['note'] = $request->note?$request->note:'';
                    $appointment_id = Appointment::insertGetId($data);
                    if ($appointment_id) {
                        $slotdata['start_time'] = $request->time;
                        // $slotdata['end_time'] = $request->end_time;
                        $slotdata['date'] = $request->date;
                        $slotdata['entity_id'] = $request->entity_id;
                        $slotdata['user_id'] = $request->user_id;
                        $slotdata['appointment_id'] = $appointment_id;
                        $slotdata['status'] = 1;
                        $addSlot = Slots::insertGetId($slotdata);
                        if ($addSlot) {
                            return response()->json(['status'=>'true','message'=>'Appointment Booked','id'=>(String)$appointment_id], $this->successStatus);
                        }
                    }else{
                        return response()->json(['status'=>'false','message'=>'Something went wrong'], $this->badrequest);
                    }
                }
            }else{
                return response()->json(['status'=>'false','message'=>'User not found'], $this->badrequest);
            }
        }
    }

    public function findDoctor(Request $request){
        // dd("jj");
        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'type' => 'required',
            // 'country' => 'required',
            // 'city' => 'required',
            // 'specility' => 'required',
            // 'insurance' => 'required',
            // 'availablity' => 'required',
            // 'gender' => 'required', //advance filter
            // 'availablity_type' => 'required', //advance filter
            // 'language' => 'required', //advance filter
            // 'availablity_time' => 'required', //advance filter
            // 'with_profile_images' => 'required', //advance filter
            // 'avg_rating' => 'required', //advance filter
        ]);
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(),'status'=>'false'], $this->badrequest);
        }else{
            $userExist = User::where('id', $request->user_id)->first();
            if($userExist){
                if ($request->type == '1') {
                    $q = Provider::query();
                    if ($request->country){
                        $q->where('country','like',$request->country);
                    }
                    if ($request->city){
                        $q->where('town_city','like',$request->city);
                    }

                    if ($request->specility){
                        $q->where('specialization','like',$request->specility);
                    }

                    if ($request->insurance){
                        // $q->where('insurance','like',$request->insurance);
                    }

                    if ($request->state){
                        $q->where('state','like',$request->state);
                    }

                    if ($request->gender){
                        $q->where('gender','like',$request->gender);
                    }

                    if ($request->availablity_type){
                        $q->where('visit_type','like',$request->gender);
                    }

                    if ($request->availablity_time){
                        $q->where('open_from','like',$request->availablity_time);
                    }

                    if ($request->with_profile_images){
                        $q->where('profile_pic_uploaded',$request->with_profile_images);
                    }

                    if ($request->avg_rating){
                        $q->where('ratings','like',$request->avg_rating);
                    }

                    $providers = $q->orderBy('id','DESC')->get();
                    // print_r($providers);die();
                    $providersArr = [];
                        foreach ($providers as $pro) {
                            $logo = url('/').'/images/provider_pictures/'.$pro['profile_image'];
                            $list['provider_id'] = (String)$pro['id'];
                            $list['provider_type'] = (String)$pro['provider_type'];
                            $list['name'] = $pro['name'];
                            $list['building_no'] = $pro['building_no'];
                            $list['town_city'] = $pro['town_city'];
                            $list['state'] = $pro['state'];
                            $list['country'] = $pro['country'];
                            $list['phone_no'] = $pro['phone_no'];
                            $list['ratings'] = $pro['ratings'];
                            $list['logo'] = $logo;
                            $list['isLiked'] = '0';
                            $providersArr[] = $list;
                        }
                        return response()->json([
                            'status'=>'true',
                            'message'=>'data fetched successfully',
                            'data'=>$providersArr
                        ], $this->successStatus);
                }elseif($request->type == '2'){
                    $q = Provider::query();
                    if ($request->country){
                        $q->where('country','like',$request->country);
                    }
                    if ($request->city){
                        $q->where('town_city','like',$request->city);
                    }

                    if ($request->specility){
                        $q->where('specialization','like',$request->specility);
                    }

                    if ($request->insurance){
                        // $q->where('insurance','like',$request->insurance);
                    }

                    if ($request->state){
                        $q->where('state','like',$request->state);
                    }

                    if ($request->gender){
                        $q->where('gender','like',$request->gender);
                    }

                    if ($request->availablity_type){
                        $q->where('visit_type','like',$request->gender);
                    }

                    if ($request->availablity_time){
                        $q->where('open_from','like',$request->availablity_time);
                    }

                    if ($request->with_profile_images){
                        $q->where('profile_pic_uploaded',$request->with_profile_images);
                    }

                    if ($request->avg_rating){
                        $q->where('ratings','like',$request->avg_rating);
                    }

                    $providers = $q->orderBy('id','DESC')->get();
                    $providersArr = [];
                    foreach ($providers as $pro) {
                        $logo = url('/').'/public/images/provider_pictures/'.$pro['profile_image'];
                            $list['provider_id'] = (String)$pro['id'];
                            $list['provider_type'] = (String)$pro['provider_type'];
                            $list['name'] = $pro['name'];
                            $list['building_no'] = $pro['building_no'];
                            $list['town_city'] = $pro['town_city'];
                            $list['state'] = $pro['state'];
                            $list['country'] = $pro['country'];
                            $list['phone_no'] = $pro['phone_no'];
                            $list['ratings'] = $pro['ratings'];
                            $list['logo'] = $logo;
                            $list['isLiked'] = '0';
                            $providersArr[] = $list;
                    }
                    return response()->json([
                        'status'=>'true',
                        'message'=>'data fetched successfully',
                        'data'=>$providersArr
                    ], $this->successStatus);
                }
            }else{
                return response()->json([
                    'status'=>'false',
                    'message'=>'Unauthenticated User'
                ], $this->badrequest);
            }
        }
    }

    public function providerDetails(Request $request){
        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'provider_id' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(),'status'=>'false'], $this->badrequest);
        }else{
            $provider = Provider::where('id',$request->provider_id)->first();
            if ($provider) {
                $provider['profile_image'] = url('/').'/public/images/provider_pictures/'.$provider['profile_image'];
                $customerRating[] = array(
                    'name'=> 'test user',
                    'image'=> url('/').'/public/images/user_pictures/default.jpg',
                    'rating'=> "4.0",
                    'comment'=> "test data",
                    'datetime'=> "2021-09-01 01:15"
                );
                $ratingArray = array(
                    'overall_rating'=> "5.0",
                    'wait_time'=> "4.0",
                    'bedside_manner'=> "5.0",
                    'ratingArray'=>$customerRating
                );

                $slotArray[] = array(
                    'id'=> "1",
                    'time'=> "09:00 AM",
                    'is_booked'=> "0",
                    'status'=> "0",
                );
                $slotsDetails = array(
                    'provider_id'=> "1",
                    'provider_name'=> "dummy clinic",
                    'provider_address'=> "raw test, witting 517 app 1547",
                    'provider_phone'=> "+178542586",
                    'slots'=> $slotArray,
                );
                
                $providerArray = array(
                    'providerDetails'=>$provider,
                    'ratingDetails'=>$ratingArray,
                    'slotDetails'=>$slotsDetails,
                );
                return response()->json([
                    'status'=>'true',
                    'message'=>'data fetched successfully',
                    'data'=>$providerArray
                ], $this->successStatus);
            }else{
                return response()->json([
                    'status'=>'false',
                    'message'=>'No Data Found'
                ], $this->badrequest);
            }
        }
    }

    public function appointHistoryandUpcomming(Request $request){
        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'appointment_type' => 'required', //appointment_type 1 for history and 2 for cancelled appointments
        ]);
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(),'status'=>'false'], $this->badrequest);
        }else{
            $checkUser = User::where('id',$request->user_id)->first();
            if ($checkUser) {
                if ($request->appointment_type == 1) {
                    $getAppointments = Appointment::where('user_id',$request->user_id)
                    ->where('status','2')
                    ->orderBy('id','DESC')
                    ->get();
                    $histArr = [];
                    foreach ($getAppointments as $appointment) {
                        // $getsubcatDetails = DB::table('subcat_store')
                        // ->where('id',$appointment['store_id'])
                        // ->select('logo','name','subcat_id','address','status','rating')
                        // ->first();
                        // $subcatDetail = json_decode(json_encode($getsubcatDetails), true);
                        // $subcat_name = Service_Subcategory::where('id',$subcatDetail['subcat_id'])->first();
                        // $serviceLogo = $subcatDetail['logo'];
                        // $logo = url('/').'/public/images/icon/'.$serviceLogo;
                        $list['id'] = (String)$appointment['id'];
                        // $list['appointment_type'] = $subcat_name['sub_cat_name'];
                        $list['created_at'] = $appointment['created_at']->format('Y-m-d h:i:s');
                        // $list['auther_id'] = $appointment['store_id'];
                        // $list['logo'] = $logo;
                        // $list['location'] = $subcatDetail['address'];
                        // $list['name'] = $subcatDetail['name'];
                        // $list['status'] = $appointment['status'];
                        // $list['rating'] = $subcatDetail['rating'];
                        $histArr[] = $list;
                    }
                    return response()->json([
                        'status'=>'true',
                        'message'=>'data fetched successfully',
                        'data'=>$histArr
                    ], $this->successStatus);
                }elseif ($request->appointment_type == 2) {
                    $getAppointments = Appointment::where('user_id',$request->user_id)
                    ->where('status','3')
                    ->orderBy('id','DESC')
                    ->get();
                    $cancelledArr = [];
                    foreach ($getAppointments as $appointment) {
                        // $getsubcatDetails = DB::table('subcat_store')
                        // ->where('id',$appointment['store_id'])
                        // ->select('logo','name','subcat_id','address','status','rating')
                        // ->first();
                        // $subcatDetail = json_decode(json_encode($getsubcatDetails), true);
                        // $subcat_name = Service_Subcategory::where('id',$subcatDetail['subcat_id'])->first();
                        // $serviceLogo = $subcatDetail['logo'];
                        // $logo = url('/').'/public/images/icon/'.$serviceLogo;
                        $list['id'] = (String)$appointment['id'];
                        // $list['appointment_type'] = $subcat_name['sub_cat_name'];
                        $list['created_at'] = $appointment['created_at']->format('Y-m-d h:i:s');
                        // $list['auther_id'] = $appointment['store_id'];
                        // $list['logo'] = $logo;
                        // $list['location'] = $subcatDetail['address'];
                        // $list['name'] = $subcatDetail['name'];
                        $list['status'] = $appointment['status'];
                        // $list['rating'] = $subcatDetail['rating'];
                        $cancelledArr[] = $list;
                    }
                    return response()->json([
                        'status'=>'true',
                        'message'=>'data fetched successfully',
                        'data'=>$cancelledArr
                    ], $this->successStatus);
                }else{
                    return response()->json(['status'=>'false','message'=>'Invalid inputs'], $this->badrequest);
                }
            }else{
                return response()->json(['status'=>'false','message'=>'User not found'], $this->badrequest);
            }
        }
    }

    public function reorderandCancel(Request $request){
        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'appointment_id' => 'required',
            'type' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(),'status'=>'false'], $this->badrequest);
        }else{
            $userExist = User::where('id', $request->user_id)->first();
            if($userExist){
                if ($request->type == 0) { //cancel
                    $getOrder = Appointment::where('id',$request->appointment_id)
                    ->first();
                    if ($getOrder) {
                        $updateStatus = Appointment::where('id',$request->appointment_id)
                        ->update(['status' => '3']);
                        return response()->json([
                            'status'=>'true',
                            'message'=>'Appointment Cancelled Successfully',
                        ], $this->successStatus);
                    }else{
                        return response()->json([
                            'status'=>'true',
                            'message'=>'Appointment Already Cancelled',
                        ], $this->successStatus);
                    }
                }elseif ($request->type == 1) { //reorder
                    $getOrder = Appointment::where('id',$request->appointment_id)
                    ->first();
                    if ($getOrder) {
                        $checkSlot = Slots::where('entity_id',$getOrder->entity_id)
                ->where('start_time',$request->time)
                // ->where('end_time',$request->end_time)
                ->where('date',$request->date)
                ->where('user_id',$request->user_id)
                ->where('status','1')
                // ->orWhere('status','3')
                ->first();
                // print_r($checkSlot);die();
                if ($checkSlot) {
                    return response()->json(['status'=>'true','message'=>'Slot Already Booked'], $this->badrequest);
                }else{
                    $space = ' ';
                    $data['user_id'] = $getOrder->user_id;
                    $data['entity_id'] = $getOrder->entity_id;
                    $data['payment_amount'] = $getOrder->payment_amount;
                    $data['tax'] = $getOrder->tax;
                    $data['total'] = $getOrder->total;
                    $data['payment_status'] = 1;
                    $data['has_qurantine'] = $getOrder->has_qurantine;
                    $data['is_new_customer'] = $getOrder->is_new_customer;
                    $data['date'] = $getOrder->date;
                    $data['datetime'] = $getOrder->date.$space.$getOrder->time;
                    $data['phone_number'] = $getOrder->phone_number;
                    $data['note'] = $getOrder->note?$getOrder->note:'';
                    $appointment_id = Appointment::insertGetId($data);
                    if ($appointment_id) {
                        $slotdata['start_time'] = $request->time;
                        // $slotdata['end_time'] = $checkSlot->end_time;
                        $slotdata['date'] = $request->date;
                        $slotdata['entity_id'] = $getOrder->entity_id;
                        $slotdata['user_id'] = $request->user_id;
                        $slotdata['appointment_id'] = $appointment_id;
                        $slotdata['status'] = 1;
                        $addSlot = Slots::insertGetId($slotdata);
                        if ($addSlot) {
                            return response()->json(['status'=>'true','message'=>'Appointment Booked','id'=>(String)$appointment_id], $this->successStatus);
                        }
                    }else{
                        return response()->json(['status'=>'false','message'=>'Something went wrong'], $this->badrequest);
                    }
                }
                    }else{
                       return response()->json([
                            'status'=>'true',
                            'message'=>'Appointment Not Found',
                        ], $this->successStatus);
                    }
                }
            }else{
                return response()->json([
                    'status'=>'false',
                    'message'=>'User not found'
                ], $this->badrequest);
            }
        }
    }

    public function addReview(Request $request){
        $saveArray = $request->all();
        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'id' => 'required',
            'rating' => 'required',
            'review' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(),'status'=>'false'], $this->badrequest);
        }else{
            $review = str_replace("\n", " ", $request->review);
            $data['user_id'] = $request->user_id;
            $data['entity_id'] = $request->entity_id?$request->entity_id:'';
            $data['rating'] = $request->rating;
            $data['review'] = trim($review?$review:'');
            // dd($text);
            $insert = Review::insertGetId($data);
            if ($insert) {
                /*update ratings*/
                // $totalRating = Review::where('entity_id',$request->id)->count();
                // // print_r($totalRating);die();
                // $getPer = $this->getAndUpdateRatings($request->id);
                // $rating = $getPer;
                // $updateRatings = Store::where('id',$request->id)
                // ->update(['rating' => $rating,'users' => $totalRating]);
                return response()->json([
                    'status'=>'true',
                    'message'=>'Review Added'
                ], $this->successStatus);
            }
        }
    }

}




