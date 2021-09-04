<?php

namespace App\Models;

use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class providerSchedule extends Model
{
    use SoftDeletes;

    use HasFactory;

    public $table = 'provider_sheduals';

    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';



    public $fillable = [
    	'id',
    	'providers_id',
        'date_wise',
        'day_wise',
        ];

    

   
}