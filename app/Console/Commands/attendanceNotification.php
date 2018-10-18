<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

use App\Http\Controllers\cronjobController;
use App\Http\Controllers\ictcoreController;
use App\Student;
use File;
use App\Ictcore_integration;
use App\Ictcore_attendance;
use App\Ictcore_fees;
use App\SectionModel;
use App\ClassModel;
use App\Notification;
use App\SMSLog;
use App\Attendance;
use DB;
use Carbon\Carbon;


class attendanceNotification extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'attendanceNotification:attendacenotification';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Notification sendend';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $now        = Carbon::now();
        $year       =  $now->year;
        $status     = array('Absent','Late','late');
        $attendance = DB::table('Student')
                      ->select('Student.id as student_id','Student.firstName', 'Student.middleName', 'Student.lastName','Student.fatherCellNo','Student.fatherName','Attendance.status','Attendance.regiNo')
                      ->join('Attendance' ,'Student.regiNo', '=' , 'Attendance.regiNo')
                      /*->where('Student.section',  $section_id)*/->where('Student.session',$year)->where('Attendance.date','=',Carbon::today()->toDateString())->whereIn('Attendance.status',$status);
      echo "<pre>";print_r($attendance->get());

       
       
        if($attendance->count()){
            $attendance = $attendance->get();
            $attendance_noti     = DB::table('notification_type')->where('notification','attendance')->first();
            $ictcore_attendance  = Ictcore_attendance::select("*")->first();
            $ictcore_integration = Ictcore_integration::select("*")->where('type',$attendance_noti->type)->first();
            //$ictcore_integration = Ictcore_integration::select("*")->first();
             $ict                 = new ictcoreController();
            
            foreach($attendance as $student)
            { 
                if($ictcore_integration->method=="telenor"){   
                    if($student->status=="Absent"){
                        $get_msg  = DB::table('ictcore_attendance')->first();
                        $name     = $student->firstName.' '.$student->lastName;
                        if($attendance_noti->type=='sms'){
                            $msg      =  str_replace("<<parent>>",$student->fatherName,$get_msg->description);
                            $msg      =  str_replace("<<name>>",$name,$msg);
                        }else{
                               $msg = $get_msg->telenor_file_id;     
                        }
                    }elseif($student->status=="Late" || $student->status=="late"){
                        $get_msg  = DB::table('ictcore_attendance')->first();
                        $name     = $student->firstName.' '.$student->lastName;
                        if($attendance_noti->type=='sms'){
                            $msg      =  str_replace("<<parent>>",$student->fatherName,$get_msg->late_description);
                            $msg      =  str_replace("<<name>>",$name,$msg);
                        }else{
                           $msg = $get_msg->telenor_file_id_late;         
                        }
                    }
                    $snd_msg  = $ict->verification_number_telenor_sms($student->fatherCellNo,$msg,'ICT VISION',$ictcore_integration->ictcore_user,$ictcore_integration->ictcore_password,$attendance_noti->type);

                    $smsLog = new SMSLog();
                        $smsLog->type      = "Attendance";
                        $smsLog->sender    = "telenor ";
                        $smsLog->message   = $msg;
                        $smsLog->recipient = $student->fatherCellNo;
                        $smsLog->regiNo    = $student->regiNo;
                        $smsLog->status    = $snd_msg;
                        $smsLog->save();
                }else{
                     $get_msg  = DB::table('ictcore_attendance')->first();
                    if($attendance_noti->type=='voice'){
                        if(!empty($ictcore_integration) && $ictcore_integration->ictcore_url && $ictcore_integration->ictcore_user && $ictcore_integration->ictcore_password){  
                            $data= array(
                                'first_name'         => $student->firstName,
                                'last_name'          =>  $student->lastName,
                                'phone'              =>  $student->fatherCellNo,
                                'email'              => '',
                            );
                            $contact_id = $ict->ictcore_api('contacts','POST',$data );
                            if($student->status=="Absent"){
                             $program_id = 'program_id =>'.$get_msg->ictcore_program_id;
                             $msg=$get_msg->recording;
                            }else{
                               $program_id =  'program_id =>'.$get_msg->ictcore_program_id_late;
                                $msg=$get_msg->late_file;
                            }
                            $data = array(
                                        'title' => 'Attendance',
                                         $program_id,
                                        'account_id'     => 1,
                                        'contact_id'     => $contact_id,
                                        'origin'     => 1,
                                        'direction'     => 'outbound',
                                    );
                            $transmission_id = $ict->ictcore_api('transmissions','POST',$data );
                            $transmission_send = $ict->ictcore_api('transmissions/'.$transmission_id.'/send','POST',$data=array() );
                            if(!empty($transmission_send->error)){
                                $status =$transmission_send->error->message;
                            }else{
                                $status = "Completed";
                            }

                                 //echo "bhutta<pre>".$status;exit;
                            //$msg    = $recoding;
                            $smsLog = new SMSLog();
                            $smsLog->type      = "Attendancehello";
                            $smsLog->sender    = "ictcore voice";
                            $smsLog->message   = $msg;
                            $smsLog->recipient = $student->fatherCellNo;
                            $smsLog->regiNo    = $student->regiNo;
                            $smsLog->status    = $status;
                            $smsLog->save();
                        }
                    }
                }
            }
        }
    }
}
