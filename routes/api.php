<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProviderController;
use App\Http\Controllers\PatientController;
use App\Http\Controllers\ApiController;
use App\Http\Controllers\ProviderClinics;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
  
Route::post('/createAccount', [ProviderController::class, 'register']);
Route::post('/loginProvider', [ProviderController::class, 'login']);
Route::post('/Verification', [ProviderController::class, 'forgotPassword']);
Route::post('/setNewPassword', [ProviderController::class, 'verifyAndNewPassword']);
Route::post('/editProfile', [ProviderController::class, 'update']);
Route::post('/forgotPassword', [ProviderController::class, 'forgotPassword']);
Route::post('/newPassword', [ProviderController::class, 'newPassword']);
Route::get('/getProfile', [ProviderController::class, 'profile']);
Route::post('/setSchedule', [ProviderController::class, 'setSchedule']);
Route::post('/getSchedule', [ProviderController::class, 'getNewShedual']);
Route::post('/changePassword', [ProviderController::class, 'changePassword']);
Route::post('/editSchedule', [ProviderController::class, 'editSchedule']);
Route::post('/deleteSchedule', [ProviderController::class, 'deleteSchedule']);
Route::post('/customerSupport', [ProviderController::class, 'customerSupport']);
Route::post('/deleteAccount', [ProviderController::class, 'deleteAccount']);
Route::post('/deleteProviderImages', [ProviderController::class, 'deleteProviderImages']);
Route::post('/deleteProviderProfileImages', [ProviderController::class, 'deleteProviderProfileImages']);
Route::post('/setNewSchedule', [ProviderController::class, 'setNewSchedule']);  
Route::post('/getNewSchedule', [ProviderController::class, 'getNewSchedule']);

// clinic section
Route::get('/getDoctorList/{clinic_id}', [ProviderClinics::class, 'getDoctorsList']);
Route::post('/addDoctorInClinic', [ProviderClinics::class, 'addDoctorByClinic']);
Route::get('/getClinicDoctors/{clinic_id}', [ProviderClinics::class, 'getClinicDoctors']);
Route::Post('/setScheduleByClinic', [ProviderClinics::class, 'setScheduleByClinic']);
Route::Post('/viewDoctorShedualForClinic', [ProviderClinics::class, 'viewDoctorShedualForClinic']);
Route::Post('/addDoctorRequest', [ProviderClinics::class, 'addDoctorRequest']);       
Route::post('/serchProvider', [ProviderClinics::class, 'serchProvider']);
Route::get('/getShedualedDoctors/{clinic_id}', [ProviderClinics::class, 'getShedualedDoctors']);



/*User end*/

Route::post('/save', [ApiController::class, 'save']);
Route::post('/getAll', [ApiController::class, 'getAll']);
Route::post('/getSingle', [ApiController::class, 'getSingle']);
Route::post('/update', [ApiController::class, 'update']);
Route::post('/delete', [ApiController::class, 'delete']);
Route::post('/upload', [ApiController::class, 'upload']);

Route::post('/getSubscriptions', [ApiController::class, 'getSubscriptions']);

Route::post('/register', [ApiController::class, 'register']);
Route::post('/login', [ApiController::class, 'login']);
Route::post('/changePassword', [ApiController::class, 'changePassword']);
Route::post('/forgotPassword', [ApiController::class, 'forgotPassword']);

Route::post('/resendOtp', [ApiController::class, 'resendOtp']);
Route::post('/verifyOtp', [ApiController::class, 'verifyOtp']);

Route::post('/forgotPassword2', [ApiController::class, 'forgotPassword2']);
Route::post('/resendOtp2', [ApiController::class, 'resendOtp2']);
Route::post('/verifyOtp2', [ApiController::class, 'verifyOtp2']);
Route::post('/changePassword3', [ApiController::class, 'changePassword3']);

Route::post('/editProfile', [ApiController::class, 'editProfile']);
Route::post('/changePassword2', [ApiController::class, 'changePassword2']);
Route::post('/changeLanguage', [ApiController::class, 'changeLanguage']);
Route::post('/customerSupport', [ApiController::class, 'customerSupport']);
Route::post('/deactivateAccount', [ApiController::class, 'deactivateAccount']);
Route::post('/getProfile', [ApiController::class, 'getProfile']);

Route::post('/addCountry', [ApiController::class, 'addCountry']);
Route::post('/getCountries', [ApiController::class, 'getCountries']);

Route::post('/addState', [ApiController::class, 'addState']);
Route::post('/getStates', [ApiController::class, 'getStates']);

Route::post('/addCity', [ApiController::class, 'addCity']);
Route::post('/getCities', [ApiController::class, 'getCities']);

/*User end*/

/*
|--------------------------------------------------------------------------
| PATIENT API RouteServiceProvider
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your patient application.
|
*/

Route::post('/createPatientAccount', [PatientController::class, 'register']);
Route::post('/patientLogin', [PatientController::class, 'login']);
Route::post('/patientLogout', [PatientController::class, 'logout']);
Route::post('/patientForgotPassword', [PatientController::class, 'forgotPassword']);
Route::post('/patientNewPassword', [PatientController::class, 'newPassword']);
// Route::post('/Verification', [PatientController::class, 'forgotPassword']);
// Route::post('/setNewPassword', [PatientController::class, 'verifyAndNewPassword']);
Route::post('/editPatientProfile', [PatientController::class, 'update']);
Route::post('/changePatientPassword', [PatientController::class, 'changePassword']);
Route::post('/deletePatientAccount', [PatientController::class, 'deleteAccount']);
Route::get('/searchClinicorDoctor', [PatientController::class, 'searchClinicorDoctor']);
Route::get('/popularCategories', [PatientController::class, 'popularCategories']);
// Route::get('/getProfile', [PatientController::class, 'profile']);
Route::get('/showAdds', [PatientController::class, 'showAdds']);