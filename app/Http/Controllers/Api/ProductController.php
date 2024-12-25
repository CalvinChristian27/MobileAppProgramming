<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ProductController extends Controller
{
    public function getProductsForLocation($location)
    {
        $products = Product::select(
            'image_url',
            'name',
            'location',
            'price',
            'description',
            'total_sales',
            DB::raw('ROUND (((avg_quality_rating + avg_price_rating + avg_taste_rating) / 3), 2) as avg_rating')
        )
        ->where('location', $location)
        ->get();

        return response()->json([
            'success' => true,
            'data' => $products,
        ]);
    }
}