<?php

namespace App\Http\Controllers;

// use Kreait\Firebase\Factory;
//use Kreait\Firebase\ServiceAccount;
//use Kreait\Firebase\Database;
use Illuminate\Http\Request;

use App\Models\User;
use App\Models\Country;
use App\Models\State;
use App\Models\City;
use App\Models\customerSupport;


use Validator;
use Illuminate\Support\Facades\Hash;

use DB;

class ApiController extends Controller
{ 
    
    protected $database;


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

}


    

