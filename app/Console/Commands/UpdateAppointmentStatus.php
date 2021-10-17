<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Appointment;

class UpdateAppointmentStatus extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'appointment:status';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Update expired appointments';

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
     * @return int
     */
    public function handle()
    {
        $ldate = date('Y-m-d H:i:s');
        $users = Appointment::where('status','1')
        ->where('date','<',$ldate)->update([
           'status' => '2'
        ]);
        $this->info('status update');
    }
}
