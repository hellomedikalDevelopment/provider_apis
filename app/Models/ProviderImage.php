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
class ProviderImage extends Model
{
    use SoftDeletes;

    public $table = 'provider_images';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';


    protected $dates = ['deleted_at'];



    public $fillable = [
        'provider_id',
        'image'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'provider_id' => 'string',
        'image' => 'string'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [

    ];

    function provider(){
        return $this->belongsTo('App\Models\Provider');
    }
}
