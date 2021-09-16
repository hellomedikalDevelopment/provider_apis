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
class Timeslot extends Model
{
    use SoftDeletes;

    public $table = 'time_slots';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';


    protected $dates = ['deleted_at'];



    public $fillable = [
        'entity_id',
        'day',
        'open',
        'close'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'entity_id' => 'integer',
        'day' => 'string',
        'open' => 'string',
        'close' => 'string'
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
