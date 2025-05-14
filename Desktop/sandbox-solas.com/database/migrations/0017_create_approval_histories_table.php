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
        Schema::create('approval_histories', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->foreignUuid('pengajuan_dokter_id')->references('id')->on('pengajuan_dokters')->onDelete('cascade');
            $table->string('appoval_1')->nullable();
            $table->string('appoval_2')->nullable();
            $table->enum('status_appoval_1', ['pending', 'approved', 'rejected'])->default('pending');
            $table->enum('status_appoval_2', ['pending', 'approved', 'rejected'])->default('pending');
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('approval_histories');
    }
};
