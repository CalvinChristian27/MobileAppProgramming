<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\ProductMenuController;
use App\Http\Controllers\Api\PromoController;
use App\Http\Controllers\Api\HistoryController;
use App\Http\Controllers\Api\EventController;
use App\Http\Controllers\Api\CartController;

/**
 * route "/register"
 * @method "POST"
 */
Route::post('/register', App\Http\Controllers\Api\RegisterController::class)->name('register');

/**
 * route "/login"
 * @method "POST"
 */
Route::post('/login', App\Http\Controllers\Api\LoginController::class)->name('login');

/**
 * route "/user"
 * @method "GET"
 */
Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

/**
 * route "/logout"
 * @method "POST"
 */
Route::post('/logout', App\Http\Controllers\Api\LogoutController::class)->name('logout');

Route::get('/products/location/{location}', [ProductController::class, 'getProductsForLocation']);

Route::get('/products/{name}', [ProductMenuController::class, 'getProductsByName']);

Route::get('/promo', [PromoController::class, 'getPromo']);

Route::get('/history/{productName}', [HistoryController::class, 'getHistory']);

Route::get('/event', [EventController::class, 'getEvent']);

Route::get('/cart/{transactionId}', [CartController::class, 'getCart'])->middleware('auth:sanctum');