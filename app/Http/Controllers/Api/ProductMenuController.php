<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;

class ProductMenuController extends Controller
{
    public function getProductsByName($name)
    {
        try {
            $products = Product::select(
                'image_url',
                'category',
                'location',
                'name',
                'total_sales',
                'price',
                'description',
                \DB::raw('ROUND (((avg_quality_rating + avg_price_rating + avg_taste_rating) / 3), 2) as avg_rating'),
                'avg_taste_rating',
                'avg_quality_rating',
                'avg_price_rating'
            )->where('name', $name)->get();

            if ($products->isEmpty()) {
                return response()->json([
                    'success' => false,
                    'message' => "No products found for this name: $name.",
                ], 404);
            }

            return response()->json([
                'success' => true,
                'data' => $products,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'An error occurred: ' . $e->getMessage(),
                'error' => $e->getMessage(),
            ], 500);
        }
    }
}
