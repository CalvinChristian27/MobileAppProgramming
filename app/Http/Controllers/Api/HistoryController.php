<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;

class HistoryController extends Controller
{
    public function getHistory($productName)
    {
        $product = Product::where('name', $productName)->first();

        if (!$product) {
            return response()->json([
                'success' => false,
                'message' => 'Product not found',
            ], 404);
        }

        $product_histories = $product->histories()->select(
            'title',
            'description',
            'image_url'
        )->get();

        return response()->json([
            'success' => true,
            'data' => $product_histories,
        ]);
    }
}
