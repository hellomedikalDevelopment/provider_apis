<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Provider;
use Validator;
use DB;
use App\Models\Clinic_doctors;
use Illuminate\Support\Facades\Mail;

class HelperController.php extends Controller
{
  public function previousShedual($doctor_id,$viewdate)
    {   

        print_r(array($doctor_id,$viewdate));die;
                  $videoDateWise=array();
                  $inPersonDateWise=array();
                  $person=array();
                  $video=array();
                  $daywiseData=null;
                  $reciveDate=$viewdate;
                  $NewreciveDate=str_ireplace('-', '/', $reciveDate); 
                  $covertDate=date("Y-m-d", strtotime($NewreciveDate));
                  $timestamp = strtotime($covertDate);
                  $day = date('D', $timestamp); 
                  $allData=Clinic_doctors::where(array("doctor_id"=>$doctor_id))->first(); 
                  if(empty($allData)){return false;}
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
                        $RES=array('status'=>"1",'message'=>"Get shedual successfully",'type'=>'WithClinic','date'=>$reciveDate,'provider_id'=>$doctor_id,'data'=>array(0 =>$inPersonDateWise,1 => $videoDateWise));
                        }elseif(!empty($inPersonDateWise['timing'])){
                             $RES=array('status'=>"1",'message'=>"Get shedual successfully",'type'=>'WithClinic','date'=>$reciveDate,'provider_id'=>$doctor_id,'data'=>array(0 =>$inPersonDateWise));
                        }elseif(!empty($videoDateWise['timing'])){
                             $RES=array('status'=>"1",'message'=>"Get shedual successfully",'type'=>'WithClinic','date'=>$reciveDate,'provider_id'=>$doctor_id,'data'=>array(0 =>$videoDateWise));
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
                        $RESDAY=array('status'=>"1",'message'=>"Get shedual successfully",'type'=>'WithClinic','date'=>$reciveDate,'provider_id'=>$doctor_id,'data'=>array(0 =>$person,1 => $video));
                        }elseif(!empty($person['timing'])){
                             $RESDAY=array('status'=>"1",'message'=>"Get shedual successfully",'type'=>'WithClinic','date'=>$reciveDate,'provider_id'=>$doctor_id,'data'=>array(0 =>$person));
                        }elseif(!empty($video['timing'])){
                             $RESDAY=array('status'=>"1",'message'=>"Get shedual successfully",'type'=>'WithClinic','date'=>$reciveDate,'provider_id'=>$doctor_id,'data'=>array(0 =>$video));
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
