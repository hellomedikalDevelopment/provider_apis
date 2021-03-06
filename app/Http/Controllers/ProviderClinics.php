<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Provider;
use Validator;
use DB;
use App\Models\Clinic_doctors;
use Illuminate\Support\Facades\Mail;
class ProviderClinics extends Controller
{
   
  public function getDoctorsList($clinic_id,$keyword=null)
  {
   
          $store=[];
         DB::enableQueryLog();
         $doctorsPersent=Clinic_doctors::select(['doctor_id'])->where(['clinic_id'=>$clinic_id])->get();

         foreach($doctorsPersent as $d){ 
                $store[]=$d->doctor_id;}
         if($keyword==null){
        $doctors=Provider::where(['provider_type'=>1])->whereNotIn('id',$store)
              ->get();
          }else{
         
              $doctors=Provider::where(['provider_type'=>"1"])->whereNotIn('id',$store)->where('name', 'like', "%$keyword%")->orWhere('email', 'like', "%$keyword%")->where(['provider_type'=>"1"])->whereNotIn('id',$store)->orWhere('phone_no', 'like', "%$keyword%")->where(['provider_type'=>"1"])->whereNotIn('id',$store)->orWhere('department', 'like', "%$keyword%")->where(['provider_type'=>"1"])->whereNotIn('id',$store)->orWhere('specialization', 'like', "%$keyword%")->where(['provider_type'=>"1"])->whereNotIn('id',$store)->get();
             // var_dump($doctors);
          }

        return response()->json([
                        'status'=>'1',
                        'message'=>'doctors list',
                        'data'=>  $doctors
                    ], 200);
          
  }

  
  public function addDoctorRequest(Request $request)
  {
     $validator = Validator::make($request->all(), [
            'doctor_id' => 'required',
        ]);
        if ($validator->fails()) {   
            return response()->json(['message'=>$validator->errors()->first(),'status'=>'0'], 200);
        }
        else{
     $doctor=Provider::where(['id'=>$request->doctor_id])->first();
            $doctor_email= $doctor->email;
            $otp = rand (1000 , 9999);
            $msg = [
                "name" => $doctor_email,
                "otp" => $otp
            ];
            $email = $doctor_email;
            Mail::send('adddoctor', $msg, function($message) use ($email) {
                $message->to($email);
                $message->subject('Clinic wants to add you !!!');
            });
            return response()->json(['status' =>'1' ,'message'=>'OTP has been sent to your email','otp'=>$otp], 200);
        }
  }

  public function addDoctorByClinic(Request $request)
  {
     $validator = Validator::make($request->all(), [
            'clinic_id' => 'required',
            'doctor_id' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(),'status'=>'0'], 200);
        }
        else{
           
            $addDoctor =  new Clinic_doctors;
            $addDoctor->clinic_id  = $request->clinic_id;
            $addDoctor->doctor_id  = $request->doctor_id ;
            $addDoctor->save();

                return response()->json([
                    'status'=>'1',
                    'message'=>'Doctor add successfully',
                ], 200);
        }
  }

  public function getClinicDoctors($clinic_id,$keyword=null)
  {
    $doc_ids=[];
    $data=Clinic_doctors::select('doctor_id')->where(['clinic_id'=>$clinic_id])->get();
    foreach($data as $each){
        $doc_ids[]= $each->doctor_id;
    }
    if($keyword==null){
    $mydocs=Provider::whereIn('id', $doc_ids)->get();
    }else{
    $mydocs=Provider::whereIn('id', $doc_ids)->where('name', 'like', "%$keyword%")->orWhere('email', 'like', "%$keyword%")->whereIn('id', $doc_ids)->orWhere('phone_no', 'like', "%$keyword%")->whereIn('id', $doc_ids)->orWhere('department', 'like', "%$keyword%")->whereIn('id', $doc_ids)->orWhere('specialization ', 'like', "%$keyword%")->whereIn('id', $doc_ids)->get();
    }
    return response()->json([
                    'status'=>'1',
                    'data'=>$mydocs,
                    'message'=>'Clinic Doctors',
                ], 200);
  }

public function setScheduleByClinic(Request $request)    
    {  
       $recived=$request->getContent();
       $encoded=json_decode($recived,true);
       if(!empty($encoded)){
       $recive_date= $encoded['date'];
       $provider_id= $encoded['doctor_id'];
       $clinic_id= $encoded['clinic_id'];
       if(!empty($recive_date) && !empty($provider_id)){
       $data= $encoded['data'];
       $DateFinalArray=array();
       $DaysFinalArray=array();
    
       $user=Clinic_doctors::where(array("doctor_id"=>$provider_id,"clinic_id"=>$clinic_id))->first(); 
       if($user==null){
               return response()->json([
                    'status'=>'0',
                    'message'=>'Clinic/Doctors is not associated with each other',
                ], 200);
       }
        if($user->date_wise==null){
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

                 Clinic_doctors::where(array("doctor_id"=>$provider_id,'clinic_id'=>$clinic_id))->update(array('day_wise' => json_encode($DaysFinalArray),'date_wise' => json_encode($DateFinalArray)));  
              
                return response()->json(['message'=>'Shedual Saved','status'=>'1'], 200);
                
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
                  
                       
                     } 
                     Clinic_doctors::where(array("doctor_id"=>$provider_id,'clinic_id'=>$clinic_id))->update(array('day_wise' => json_encode($DayFinalArray),'date_wise' => json_encode($DateFinalArray),'day_delete'=>json_encode($day_delete)));   

                       return response()->json(['message'=>'Shedual Updated','status'=>'1'], 200);

               }
           }else{
             return response()->json(['message'=>'Please fill required Fields','status'=>'0'], 200);
           }
       }else{ return response()->json(['message'=>'Please send data','status'=>'0'], 400); }
    }

    public function viewDoctorShedualForClinic(Request $request)
    {
            $validator = Validator::make($request->all(), [
                'doctor_id' => 'required',
                'clinic_id' => 'required',
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
                  $allData=Clinic_doctors::where(array("doctor_id"=>$request->doctor_id,"clinic_id"=>$request->clinic_id))->first(); 
                  // print_r($allData);die();
                  if(empty($allData)){return response()->json(['status'=>'0','message'=>'clinic and doctor not associated to each other'], 200);}
                  if($allData->date_wise!=NULL){
                    $dataDataDecode=json_decode($allData->date_wise,true);//print_r($dataDataDecode);die;
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
                        $RES=array('status'=>"1",'message'=>"Get shedual successfully",'type'=>'WithClinic','date'=>$reciveDate,'provider_id'=>$request->doctor_id,'data'=>array(0 =>$inPersonDateWise,1 => $videoDateWise));
                        }elseif(!empty($inPersonDateWise['timing'])){
                             $RES=array('status'=>"1",'message'=>"Get shedual successfully",'type'=>'WithClinic','date'=>$reciveDate,'provider_id'=>$request->doctor_id,'data'=>array(0 =>$inPersonDateWise));
                        }elseif(!empty($videoDateWise['timing'])){
                             $RES=array('status'=>"1",'message'=>"Get shedual successfully",'type'=>'WithClinic','date'=>$reciveDate,'provider_id'=>$request->doctor_id,'data'=>array(0 =>$videoDateWise));
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
                        $RESDAY=array('status'=>"1",'message'=>"Get shedual successfully",'type'=>'WithClinic','date'=>$reciveDate,'provider_id'=>$request->doctor_id,'data'=>array(0 =>$person,1 => $video));
                        }elseif(!empty($person['timing'])){
                             $RESDAY=array('status'=>"1",'message'=>"Get shedual successfully",'type'=>'WithClinic','date'=>$reciveDate,'provider_id'=>$request->doctor_id,'data'=>array(0 =>$person));
                        }elseif(!empty($video['timing'])){
                             $RESDAY=array('status'=>"1",'message'=>"Get shedual successfully",'type'=>'WithClinic','date'=>$reciveDate,'provider_id'=>$request->doctor_id,'data'=>array(0 =>$video));
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

   public function serchProvider(Request $request)
    {
         $validator = Validator::make($request->all(), [
                'clinic_id' => 'required',
                'keyword' => 'required',
              ]);
            if ($validator->fails()) {
                return response()->json(['message'=>$validator->errors()->first(),'status'=>'0'], 200);
            }
            else{
                    $store=[];
                     $Clinic_doctors=Clinic_doctors::select(['doctor_id'])->where(['clinic_id'=>$request->clinic_id],['date_wise','!=',NULL])->get();
                     foreach($Clinic_doctors as $d){
                            $store[]=$d->doctor_id;
                     }
                     $doctors=Provider::whereIn('id', $store)->where('name', 'like', "%$request->keyword%")->orWhere('email', 'like', "%$request->keyword%")->orWhere('phone_no', 'like', "%$request->keyword%")->orWhere('department', 'like', "%$request->keyword%")->get();
                     return response()->json([
                    'status'=>'1',
                    'message'=>'doctors list',
                    'data'=>  $doctors
                        ], 200);
                }
    }   
    public function getShedualedDoctors($clinic_id,$keyword=null)
    {
        
                $store=[];   
                     $doctors=Clinic_doctors::select(['doctor_id','date_wise'])->where(['clinic_id'=>$clinic_id])->get();   
                     foreach($doctors as $d){ 
                        if($d->date_wise!=NULL){
                            $store[]=$d->doctor_id;
                        }
                     }
                  if($keyword==null){
                       $mydocs=Provider::whereIn('id', $store)->get();
                   }else{
                        $mydocs=Provider::whereIn('id', $store)->where('name', 'like', "%$keyword%")->orWhere('email', 'like', "%$keyword%")->whereIn('id', $store)->orWhere('phone_no', 'like', "%$keyword%")->whereIn('id', $store)->orWhere('department', 'like', "%$keyword%")->whereIn('id', $store)->orWhere('specialization ', 'like', "%$keyword%")->whereIn('id', $store)->get();
                   }
                        return response()->json([
                        'status'=>'1',
                        'data'=>$mydocs,
                        'message'=>'Clinic Doctors',
                    ], 200);
                
    }    

    public function deleteScheduleByClinic(Request $request)
    {
    $validator = Validator::make($request->all(), [
            'providers_id' => 'required',
            'clinic_id' => 'required',
            'type' => 'required',
            'schedule_date' => 'required',
            ]);
        if ($validator->fails()) {
            return response()->json(['message'=>$validator->errors()->first(),'status'=>'0'], $this->successStatus);
        }
        else{ 
            $reciveDate=$request->schedule_date;
            $type=$request->type;
           $allData=Clinic_doctors::where(array('doctor_id'=>$request->providers_id,'clinic_id'=>$request->clinic_id))->first();
             if(empty($allData)){return response()->json(['status'=>"0",'message'=>'clinic and doctor not associated to each other'], 200);}
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
                                
                                   
                                 
                                    Clinic_doctors::where(array('doctor_id'=>$request->providers_id,'clinic_id'=>$request->clinic_id))->update(['date_wise'=>json_encode($dataDataDecode)]); 
                                    return response()->json(['message'=>"Shedual delete successfully",'status'=>'1'], '200');
                       
                 }else{ 
                    $dayDate=json_decode($allData->day_delete,true);
                    if($dayDate){
                        if(array_key_exists($reciveDate,$dayDate)){ 
                                $oldarray=$dayDate[$reciveDate];
                                array_push($oldarray,$request->type);
                                $dayDate[$reciveDate]=$oldarray;
                            Clinic_doctors::where(array('doctor_id'=>$request->providers_id,'clinic_id'=>$request->clinic_id))->update(array('day_delete' => json_encode($dayDate)));  

                        }else{
                             
                             $dayDate[$reciveDate]=array($request->type);
                             
                             $d=Clinic_doctors::where(array('doctor_id'=>$request->providers_id,'clinic_id'=>$request->clinic_id))->update(array('day_delete' => json_encode($dayDate)));
                            
                        }
                    }else{ 
                             $newarray=array($reciveDate=>array($request->type));
                             Clinic_doctors::where(array('doctor_id'=>$request->providers_id,'clinic_id'=>$request->clinic_id))->update(array('day_delete' => json_encode($newarray)));
                        }
                   
                    return response()->json(['message'=>"Shedual delete successfully1",'status'=>'1'], '200');
                 }
             }
         }
    }  

   
}
