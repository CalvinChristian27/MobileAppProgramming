<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Promo;
use Illuminate\Http\Request;

class PromoController extends Controller
{
    public function getPromo()
    {
        $promotions = Promo::select(
            'name', 
            'description', 
            'discount_percentage', 
            'valid_from', 
            'valid_until', 
            'image_url'
        )->get();

        return response()->json([
            'success' => true,
            'data' => $promotions,
        ]);
    }
}