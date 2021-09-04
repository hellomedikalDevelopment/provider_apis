<?php

namespace App\Models;

use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Password_reset extends Model
{
    use SoftDeletes;

    use HasFactory;

    public $table = 'password_resets';

    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';


    protected $dates = ['deleted_at'];

    public $fillable = [
        'email',
        'otp'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'email' => 'string',
        'otp' => 'string'
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

    public function detail()
    {
        return $this->hasOne('App\Models\Providerdetail');
    }

    public function images()
    {
        return $this->hasMany('App\Models\ProviderImage');
    }
}
