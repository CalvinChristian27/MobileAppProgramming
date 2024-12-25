<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('location');
            $table->enum('category', ['Beku', 'Goreng', 'Basah', 'Kemasan', 'Kaleng']);
            $table->decimal('price', 10, 2);
            $table->text('description');
            $table->string('image_url');
            $table->integer('total_sales')->default(0);
            $table->float('avg_quality_rating', 3, 2)->default(0);
            $table->float('avg_price_rating', 3, 2)->default(0);
            $table->float('avg_taste_rating', 3, 2)->default(0);
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('products');
    }
};
