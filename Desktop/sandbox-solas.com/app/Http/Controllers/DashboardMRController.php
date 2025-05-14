<?php

namespace App\Http\Controllers;

use App\Models\Absensi;
use App\Models\DailyVisit;
use App\Models\Pengumuman;
use App\Models\SelfSchedule;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DashboardMRController extends Controller
{

    public function index()
    {
        // Atau dengan Eloquent:
        $absensibulanan = Absensi::whereYear('tanggal', now()->year)
            ->whereMonth('tanggal', now()->month)
            ->where('user_id', Auth::id())
            ->count();
        $absensiluarkota = Absensi::whereYear('tanggal', now()->year)
            ->whereMonth('tanggal', now()->month)
            ->where('user_id', Auth::id())
            ->where('status', 'luar_kota')
            ->count();

        $absensidalamkota = Absensi::whereYear('tanggal', now()->year)
            ->whereMonth('tanggal', now()->month)
            ->where('user_id', Auth::id())
            ->where('status', 'dalam_kota')
            ->count();

        $absensiizin = Absensi::whereYear('tanggal', now()->year)
            ->whereMonth('tanggal', now()->month)
            ->where('user_id', Auth::id())
            ->where('keterangan', 'izin')
            ->count();

        $userId = Auth::user()->id;

        // Rentang waktu
        $today = Carbon::today();
        $last7Days = $today->copy()->subDays(6);
        $last1Month = $today->copy()->subMonth();
        $last3Months = $today->copy()->subMonths(3);

        // Fungsi untuk hitung data per range
        $getStats = function ($from) use ($userId, $today) {
            return DailyVisit::select('status')
                ->selectRaw('count(*) as total')
                ->where('user_id', $userId)
                ->whereBetween('tanggal_target', [$from, $today])
                ->groupBy('status')
                ->pluck('total', 'status')
                ->toArray();
        };

        $stats_7 = $getStats($last7Days);
        $stats_30 = $getStats($last1Month);
        $stats_90 = $getStats($last3Months);

        $labels = ['progress', 'selesai', 'tidak_terpenuhi'];

        // Format data untuk Chart
        $data_7 = array_map(fn($label) => $stats_7[$label] ?? 0, $labels);
        $data_30 = array_map(fn($label) => $stats_30[$label] ?? 0, $labels);
        $data_90 = array_map(fn($label) => $stats_90[$label] ?? 0, $labels);

        //=====
        $userId = Auth::id();
        $dateRanges = [
            '7' => $today->copy()->subDays(6),
            '30' => $today->copy()->subDays(29),
            '90' => $today->copy()->subDays(89),
        ];

        $dokterStats = [];
        $instansiStats = [];

        foreach ($dateRanges as $key => $startDate) {
            $dokterStats[$key] = DailyVisit::where('user_id', $userId)
                ->whereBetween('tanggal_target', [$startDate, $today])
                ->whereNotNull('dokter_id')
                ->count();

            $instansiStats[$key] = DailyVisit::where('user_id', $userId)
                ->whereBetween('tanggal_target', [$startDate, $today])
                ->whereNotNull('instansi_id')
                ->count();
        }

        //====
        $kunjunganhariini = SelfSchedule::where('user_id', Auth::id())
            ->with('user', 'DailyVisit.dokter', 'DailyVisit.instansi')
            ->where('tanggal', now()->format('Y-m-d'))
            ->get();
        return view('mr.dashboard.index', [
            'absensibulanan' => $absensibulanan,
            'absensiluarkota' => $absensiluarkota,
            'absensidalamkota' => $absensidalamkota,
            'absensiizin' => $absensiizin,
            'data_7' => $data_7,
            'data_30' => $data_30,
            'data_90' => $data_90,
            'labels' => $labels,
            'dokterStats' => $dokterStats,
            'instansiStats' => $instansiStats,
            'kunjunganhariini' => $kunjunganhariini,
            'pengumuman' => Pengumuman::where('status', 'published')->get(),
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
