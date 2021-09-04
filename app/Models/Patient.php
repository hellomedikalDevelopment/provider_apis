<?php

namespace App\Models;

use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Patient extends Model
{
    use SoftDeletes;

    use HasFactory;

    public $table = 'patients';

    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';


    protected $dates = ['deleted_at'];

    public $fillable = [
        'first_name',
        'last_name',
        'email',
        'phone_no',
        'gender',
        'age',
        'country',
        'state',
        'city',
        'zipcode',
        'password',
        'remember_token',
        'profile_image'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'first_name' => 'string',
        'last_name' => 'string',
        'email' => 'string',
        'phone_no' => 'string',
        'gender' => 'string',
        'age' => 'integer',
        'country' => 'string',
        'state' => 'string',
        'city' => 'string',
        'password' => 'string',
        'remember_token' => 'string',
        'image' => 'string'
    ];
}
