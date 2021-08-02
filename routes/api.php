<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProviderController;
use App\Http\Controllers\PatientController;

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
Route::post('/login', [ProviderController::class, 'login']);
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

/*
|--------------------------------------------------------------------------
| PATIENT API Routes
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