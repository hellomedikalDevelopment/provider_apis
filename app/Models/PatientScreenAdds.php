<?php

namespace App\Models;

use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;

/**
 * Class patient_screen_adds
 * @package App\Models
 */

class PatientScreenAdds extends Model
{
    use SoftDeletes;

    public $table = 'patient_screen_ads';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';


    protected $dates = ['deleted_at'];

    public $fillable = [
        'screen_id',
        'name',
        'image'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'screen_id' => 'integer',
        'name' => 'string',
        'image' => 'string'
    ];
}
