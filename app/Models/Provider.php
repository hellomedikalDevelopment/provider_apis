<?php

namespace App\Models;

use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Provider extends Model
{
    use SoftDeletes;

    use HasFactory;

    public $table = 'users';

    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';


    protected $dates = ['deleted_at'];

    public $fillable = [
        'social_id',
        'device_id',
        'device_type',
        'remember_token',
        'referral_code',
        'referral_by',
        'stripe_customer_id',
        'stripe_id',
        'stripe_verified',
        'name',
        'username',
        'email',
        'dob',
        'otp',
        'password',
        'gender',
        'phone_no',
        'country_code',
        'country',
        'image',
        'bio',
        'type',
        'login_status',
        'email_verified_at',
        'ban'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'social_id' => 'string',
        'device_id' => 'string',
        'device_type' => 'string',
        'remember_token' => 'string',
        'referral_code' => 'string',
        'referral_by' => 'string',
        'stripe_customer_id' => 'string',
        'stripe_id' => 'string',
        'stripe_verified' => 'string',
        'name' => 'string',
        'username' => 'string',
        'email' => 'string',
        'dob' => 'string',
        'otp' => 'integer',
        'password' => 'string',
        'gender' => 'string',
        'phone_no' => 'string',
        'country_code' => 'integer',
        'country' => 'string',
        'image' => 'string',
        'bio' => 'string',
        'type' => 'string',
        'login_status' => 'string',
        'email_verified_at' => 'datetime',
        'ban' => 'string'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        // 'social_id' => 'nullable|string|max:255',
        // 'device_id' => 'nullable|string|max:255',
        // 'device_type' => 'nullable|string|max:100',
        // 'remember_token' => 'nullable|string|max:255',
        // 'referral_code' => 'nullable|string|max:255',
        // 'referral_by' => 'nullable|string|max:100',
        // 'stripe_customer_id' => 'nullable|string|max:255',
        // 'stripe_id' => 'nullable|string|max:255',
        // 'stripe_verified' => 'required|string|max:100',
        // 'name' => 'nullable|string|max:255',
        // 'username' => 'nullable|string|max:100',
        // 'email' => 'nullable|string|max:255',
        // 'dob' => 'nullable|string|max:255',
        // 'otp' => 'nullable|integer',
        // 'password' => 'nullable|string|max:255',
        // 'gender' => 'nullable|string|max:100',
        // 'phone_no' => 'nullable|string|max:255',
        // 'country_code' => 'nullable|integer',
        // 'country' => 'nullable|string|max:255',
        // 'image' => 'required|string|max:255',
        // 'bio' => 'nullable|string|max:255',
        // 'type' => 'required|string',
        // 'login_status' => 'required|string',
        // 'email_verified_at' => 'nullable',
        // 'ban' => 'required|string',
        // 'created_at' => 'nullable',
        // 'updated_at' => 'nullable',
        // 'deleted_at' => 'nullable|string|max:100'
    ];

    public function profile()
    {
        return $this->hasOne('App\Models\Userdetail');
    }
}
