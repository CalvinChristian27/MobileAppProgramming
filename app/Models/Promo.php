<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Promo extends Model
{
    use HasFactory;

    protected $table = 'promotions';

    protected $fillable = [
        'name', 
        'description', 
        'discount_value',
        'discount_percentage', 
        'image_url',
        'valid_until', 
        'valid_from' 
    ];
}
