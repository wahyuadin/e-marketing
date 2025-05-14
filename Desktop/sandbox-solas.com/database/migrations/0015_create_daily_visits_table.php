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
        Schema::create('daily_visits', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->foreignUuid('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreignUuid('dokter_id')->nullable()->references('id')->on('dokters')->onUpdate('cascade');
            $table->foreignUuid('instansi_id')->nullable()->references('id')->on('instansis')->onUpdate('cascade');
            $table->string('waktu_kunjungan')->nullable();
            $table->enum('jenis_kunjungan', ['remiding', 'garapan', 'lainnya'])->nullable();
            $table->string('jenis_kunjungan_lainnya')->nullable();
            $table->string('keperluan')->nullable();
            $table->string('keterangan')->nullable();
            $table->enum('status', ['selesai', 'progress', 'tidak_terpenuhi'])->default('progress');
            $table->string('longitude')->nullable();
            $table->string('latitude')->nullable();
            $table->date('tanggal_target')->nullable();
            $table->date('tanggal_realisasi')->nullable();
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('daily_visits');
    }
};
