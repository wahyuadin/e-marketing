<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('region_details', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->foreignUuid('region_id')->references('id')->on('regions')->onDelete('cascade');
            $table->foreignUuid('wilayah_id')->references('id')->on('wilayahs')->onDelete('cascade');
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('region_details');
    }
};
