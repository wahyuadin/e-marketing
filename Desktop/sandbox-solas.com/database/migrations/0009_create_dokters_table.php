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
        Schema::create('dokters', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->foreignUuid('instansi_id')->nullable()->references('id')->on('instansis')->onDelete('cascade');
            $table->foreignUuid('spesialis_id')->nullable()->references('id')->on('spesialis')->onDelete('cascade');
            $table->foreignUuid('wilayah_id')->references('id')->on('wilayahs')->onDelete('cascade');
            $table->string('dokter');
            $table->string('email')->unique();
            $table->string('instagram')->nullable();
            $table->string('no_hp');
            $table->text('alamat_rumah')->nullable();
            $table->text('alamat_praktek')->nullable();
            $table->string('bank_1');
            $table->string('bank_2')->nullable();
            $table->string('bank_3')->nullable();
            $table->string('atas_nama_1');
            $table->string('atas_nama_2')->nullable();
            $table->string('atas_nama_3')->nullable();
            $table->string('rekening_1');
            $table->string('rekening_2')->nullable();
            $table->string('rekening_3')->nullable();
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('dokters');
    }
};
