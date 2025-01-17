<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\OrderDetail;
use App\Models\Product;
use Illuminate\Http\Request;

class CartController extends Controller
{
    public function getCart($transactionId)
    {
        $cartItems = OrderDetail::with(['product.location'])
            ->where('transaction_id', $transactionId)
            ->get();

        $groupedCart = $cartItems->groupBy(function ($item) {
            return $item->product->location->name ?? 'Tanpa Lokasi';
        });

        $cartData = [];
        $totalPrice = 0;

        foreach ($groupedCart as $location => $items) {
            $group = [
                'location' => $location,
                'products' => [],
            ];

            foreach ($items as $item) {
                $group['products'][] = [
                    'id' => $item->id,
                    'name' => $item->product->name,
                    'price' => $item->product->price,
                    'quantity' => $item->quantity,
                    'subtotal' => $item->subtotal,
                    'status' => $item->product->status,
                ];
                $totalPrice += $item->subtotal;
            }

            $cartData[] = $group;
        }

        $unavailableProducts = Product::where('is_available', false)->get();

        $recommendedProducts = Product::where('is_recommended', true)->take(5)->get();

        return response()->json([
            'success' => true,
            'data' => [
                'cart' => $cartData,
                'total_price' => $totalPrice,
                'unavailable_products' => $unavailableProducts,
                'recommended_products' => $recommendedProducts,
            ],
        ]);
    }
}
