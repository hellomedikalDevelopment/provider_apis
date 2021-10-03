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
class Category extends Model
{
    use SoftDeletes;

    public $table = 'categories';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';


    protected $dates = ['deleted_at'];



    public $fillable = [
        'parent_id',
        'name'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'parent_id' => 'integer',
        'name' => 'string'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
    ];

}
