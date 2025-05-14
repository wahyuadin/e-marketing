<?php

use App\Http\Controllers\AbsensiController;
use App\Http\Controllers\ApprovalHistory;
use App\Http\Controllers\AreaController;
use App\Http\Controllers\BugReport;
use App\Http\Controllers\DaftarLaporanController;
use App\Http\Controllers\DailyvisitController;
use App\Http\Controllers\DashboardAdminController;
use App\Http\Controllers\DashboardAMController;
use App\Http\Controllers\DashboardMRController;
use App\Http\Controllers\DashboardNSMController;
use App\Http\Controllers\DashboardRSMController;
use App\Http\Controllers\DashboardSuperadminController;
use App\Http\Controllers\DokterController;
use App\Http\Controllers\InstansiController;
use App\Http\Controllers\KaryawanController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\PengajuandokterController;
use App\Http\Controllers\PengumumanController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\RegionController;
use App\Http\Controllers\RegiondetailController;
use App\Http\Controllers\RekapitulasiController;
use App\Http\Controllers\SelfScheduleController;
use App\Http\Controllers\SpesialisController;
use App\Http\Controllers\WhatsappController;
use App\Http\Controllers\WilayahController;
use App\Http\Controllers\WilayahdetailController;
use App\Http\Middleware\SesiFalse;
use Illuminate\Support\Facades\Route;

Route::get('/logout', [LoginController::class, 'logout']);
Route::middleware(SesiFalse::class)->group(function () {
    Route::resource('/', LoginController::class);
});
Route::resource('profile', ProfileController::class);
Route::middleware('auth')->group(function () {
    Route::resource('dashboard-superadmin', DashboardSuperadminController::class);
    Route::resource('dashboard-am', DashboardAMController::class);
    Route::resource('dashboard-rsm', DashboardRSMController::class);
    Route::resource('dashboard-nsm', DashboardNSMController::class);
    Route::resource('dashboard-admin', DashboardAdminController::class);
    Route::resource('dashboard-mr', DashboardMRController::class);
    Route::prefix('master-data')->group(function () {
        Route::resource('karyawan', KaryawanController::class);
        Route::resource('dokter', DokterController::class);
        Route::resource('instansi', InstansiController::class);
        Route::resource('spesialis', SpesialisController::class);
        Route::resource('area', AreaController::class);
        Route::prefix('regional')->group(function () {
            Route::resource('regional', RegionController::class);
            Route::resource('regional-detail', RegiondetailController::class);
        });
        Route::resource('area', AreaController::class);
        Route::prefix('wilayah')->group(function () {
            Route::resource('wilayah', WilayahController::class);
            Route::resource('wilayah-detail', WilayahdetailController::class);
        });
        Route::resource('rekapitulasi', RekapitulasiController::class);
    });
    Route::resource('daily-visit', DailyvisitController::class);
    Route::resource('absensi', AbsensiController::class);
    Route::resource('pengajuan-dokter', PengajuandokterController::class);
    Route::post('approval/{id}', [PengajuandokterController::class, 'approve'])->name('approve');
    Route::resource('self-schedule', SelfScheduleController::class);
    Route::get('events', [SelfScheduleController::class, 'getEvents'])->name('self-schedule.getEvents');
    Route::resource('daftar-laporan', DaftarLaporanController::class);
    Route::resource('approval-history', ApprovalHistory::class);
    Route::resource('pengumuman', PengumumanController::class);
    Route::resource('whatsapp', WhatsappController::class);
    Route::resource('bug-report', BugReport::class);
});
