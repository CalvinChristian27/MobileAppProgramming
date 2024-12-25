<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $fillable = [
        'image_url', 
        'name', 
        'location', 
        'price', 
        'description', 
        'total_sales', 
        'avg_quality_rating', 
        'avg_price_rating', 
        'avg_taste_rating'
    ];
    
    public function histories()
    {
        return $this->hasMany(History::class, 'product_id');
    }
}
