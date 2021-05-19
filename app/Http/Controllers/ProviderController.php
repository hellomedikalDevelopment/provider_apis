<?php

namespace App\Http\Controllers;

use App\Models\Provider;
use Illuminate\Http\Request;
use Response;
use Validator;
use Carbon\Carbon;

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
        dd("dd1");
        $validator = Validator::make($request->all(), [
            'deviceId' => 'required',
            'name' => 'required',
            'gender' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(),'status'=>'0'], $this->successStatus);
        }
        else{
            
        }
    }
}
