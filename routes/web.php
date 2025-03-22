<?php

use App\Http\Controllers\DashboardSuperadminController;
use App\Http\Controllers\DokterController;
use App\Http\Controllers\InstansiController;
use App\Http\Controllers\KaryawanController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\RegionController;
use App\Http\Controllers\SpesialisController;
use App\Http\Controllers\WilayahController;
use App\Http\Middleware\SesiFalse;
use Illuminate\Support\Facades\Route;

Route::get('/logout', [LoginController::class, 'logout']);
Route::middleware(SesiFalse::class)->group(function () {
    Route::resource('/', LoginController::class);
});
Route::middleware('role:superadmin')->group(function () {
    Route::resource('dashboard-superadmin', DashboardSuperadminController::class);
    Route::prefix('master-data')->group(function () {
        Route::resource('karyawan', KaryawanController::class);
        Route::resource('dokter', DokterController::class);
        Route::resource('instansi', InstansiController::class);
        Route::resource('spesialis', SpesialisController::class);
        Route::resource('regional', RegionController::class);
        Route::resource('wilayah', WilayahController::class);
        // Route::resource('absensi', App\Http\Controllers\Master\AbsensiController::class);
    });
});
