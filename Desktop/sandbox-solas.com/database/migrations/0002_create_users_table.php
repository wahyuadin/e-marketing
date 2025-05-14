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
        Schema::create('users', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->string('nip');
            $table->string('password')->unique();
            $table->string('nama');
            $table->text('alamat');
            $table->string('no_hp');
            $table->enum('status', ['active', 'deactive'])->default('active');
            $table->enum('role', ['superadmin', 'admin', 'mr', 'am', 'rsm', 'nsm']);
            $table->string('foto')->default('default.png');
            $table->string('email');
            $table->timestamp('email_verified_at')->nullable();
            $table->softDeletes();
            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users');
    }
};
