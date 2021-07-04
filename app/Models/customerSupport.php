<?php

namespace App\Models;

use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class customerSupport extends Model
{
    use SoftDeletes;

    use HasFactory;

    public $table = 'customer_support';

    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';


    protected $dates = ['deleted_at'];

    public $fillable = [
    	'id',
    	'name',
        'email',
        'phone_no',
        'subject',
        'message',
        'image',
        ];

    

   
}