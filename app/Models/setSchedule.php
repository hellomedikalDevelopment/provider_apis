<?php

namespace App\Models;

use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class setSchedule extends Model
{
    use SoftDeletes;

    use HasFactory;

    public $table = 'set_schedule';

    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';


    protected $dates = ['deleted_at'];

    public $fillable = [
    	'id',
    	'provider_id',
        'set_schedule_check',
        'schedule_date',
        'morning_time',
        'mid_time',
        'evening_time',
        'repeat_schedule',
        ];

    

   
}