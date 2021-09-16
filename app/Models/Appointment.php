<?php

namespace App\Models;

use Eloquent as Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Class Pages
 * @package App\Models
 * @version December 1, 2020, 4:42 pm UTC
 *
 * @property string $page_title
 * @property string $languages
 * @property string $category
 * @property string $cover_photo
 * @property integer $user_id
 * @property string $status
 * @property integer $followers_count
 */
class Appointment extends Model
{
    use SoftDeletes;

    public $table = 'appointments';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';


    protected $dates = ['deleted_at'];



    public $fillable = [
        'user_id',
        'entity_id',
        'payment_amount',
        'tax',
        'total',
        'payment_status',
        'has_qurantine',
        'is_new_customer',
        'phone_number',
        'date',
        'datetime',
        'note'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'user_id' => 'integer',
        'entity_id' => 'integer',
        'payment_amount' => 'string',
        'tax' => 'string',
        'total' => 'string',
        'payment_status' => 'integer',
        'has_qurantine' => 'integer',
        'is_new_customer' => 'integer',
        'phone_number' => 'string',
        'date' => 'string',
        'datetime' => 'string',
        'note' => 'string'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
    ];
}
