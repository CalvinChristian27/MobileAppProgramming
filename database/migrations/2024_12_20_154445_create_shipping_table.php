<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('shipping', function (Blueprint $table) {
            $table->id();
            $table->foreignId('transaction_id')->constrained('transactions')->onDelete('cascade');
            $table->string('origin_location');
            $table->string('destination_location');
            $table->decimal('shipping_cost', 10, 2);
            $table->string('estimated_time');
            $table->enum('status', ['Pending', 'Shipped', 'Delivered'])->default('Pending');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('shipping');
    }
};
