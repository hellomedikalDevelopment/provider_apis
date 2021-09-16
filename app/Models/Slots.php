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
class Slots extends Model
{
    use SoftDeletes;

    public $table = 'slot_bookings';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';


    protected $dates = ['deleted_at'];



    public $fillable = [
        'start_time',
        'end_time',
        'entity_id',
        'user_id',
        'appointment_id',
        'status',
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'end_time' => 'string',
        'start_time' => 'string',
        'store_id' => 'integer',
        'user_id' => 'integer',
        'appointment_id' => 'integer',
        'status' => 'string'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
    ];

    // public function likes()
    // {
    //     return $this->hasMany('App\Models\LikeComment');
    // }

    // public function tags()
    // {
    //     return $this->belongsToMany('App\Models\Tag');
    // }

    // public function scopeType($query)
    // {
    //     return $query->where('type', '=', 'P');
    // }

    // public function scopeStatus($query)
    // {
    //     return $query->where('status', '=', '1');
    // }
}
