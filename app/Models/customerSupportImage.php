<?php

namespace App\Models;

use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class customerSupportImage extends Model
{
    use SoftDeletes;

    use HasFactory;

    public $table = 'customer_support_image';

    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';


    protected $dates = ['deleted_at'];

    public $fillable = [
    	'id',
    	'customer_id',
        'image',
        'video',
        ];

    

   
}