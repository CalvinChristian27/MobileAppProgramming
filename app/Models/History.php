<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class History extends Model
{
    use HasFactory;

    protected $table = 'product_histories';

    protected $fillable = [
        'title',
        'description',
        'image_url' 
    ];

    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id');
    }
}
