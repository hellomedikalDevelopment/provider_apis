<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProviderController;

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
Route::post('/getSchedule', [ProviderController::class, 'getProvidersSchedule']);
Route::post('/changePassword', [ProviderController::class, 'changePassword']);
Route::post('/editSchedule', [ProviderController::class, 'editSchedule']);
Route::post('/deleteSchedule', [ProviderController::class, 'deleteSchedule']);
Route::post('/customerSupport', [ProviderController::class, 'customerSupport']);
Route::post('/deleteAccount', [ProviderController::class, 'deleteAccount']);