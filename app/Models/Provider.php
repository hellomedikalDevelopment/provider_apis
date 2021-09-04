<?php

namespace App\Models;

use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Provider extends Model
{
    use SoftDeletes;

    use HasFactory;

    public $table = 'providers';

    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';


    protected $dates = ['deleted_at'];

    public $fillable = [
        'provider_type',
        'name',
        'email',
        'phone_no',
        'gender',
        'department',
        'country',
        'state',
        'town_city',
        'password',
        'remember_token',
        'image',
        'open_from',
        'open_to',
        'reapeat_schedule',
        'zipcode',
        'building_no'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'provider_type' => 'string',
        'name' => 'string',
        'email' => 'string',
        'phone_no' => 'string',
        'gender' => 'string',
        'department' => 'string',
        'country' => 'string',
        'state' => 'string',
        'town_city' => 'string',
        'password' => 'string',
        'remember_token' => 'string',
        'image' => 'string',
        'open_from' => 'string',
        'open_to' => 'string',
        'reapeat_schedule' => 'string'
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
