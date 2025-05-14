<?php

namespace App\Http\Controllers;

use App\Models\DailyVisit;
use App\Models\Dokter;
use App\Models\PengajuanDokter;
use App\Models\User;
use App\Models\Wilayah;
use Illuminate\Http\Request;

class DashboardAdminController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $wilayahId = $request->wilayah_id;

        // Data Chart berdasarkan wilayah
        $chartDays = now()->subDays(6)->toPeriod(now());
        $chartLabels = [];
        $chartData = [];

        foreach ($chartDays as $day) {
            $query = DailyVisit::whereDate('tanggal_target', $day);
            if ($wilayahId) {
                $query->whereHas('dokter', function ($q) use ($wilayahId) {
                    $q->where('wilayah_id', $wilayahId);
                });
            }
            $chartLabels[] = $day->format('d M');
            $chartData[] = $query->count();
        }

        return view('superadmin.dashboard.index', [
            'roleStats' => User::selectRaw('role, count(*) as total')->groupBy('role')->get(),
            'totalDokter' => Dokter::count(),
            'pendingPengajuan' => PengajuanDokter::where('status', 'pending')->count(),
            'pengajuanPending' => PengajuanDokter::where('status', 'pending')->latest()->take(5)->get(),

            'statusVisitToday' => DailyVisit::when($wilayahId, function ($q) use ($wilayahId) {
                return $q->whereHas('dokter', fn($sub) => $sub->where('wilayah_id', $wilayahId));
            })
                ->whereDate('tanggal_target', today())
                ->selectRaw('status, count(*) as total')
                ->groupBy('status')
                ->pluck('total', 'status'),

            'totalVisitToday' => DailyVisit::when($wilayahId, function ($q) use ($wilayahId) {
                return $q->whereHas('dokter', fn($sub) => $sub->where('wilayah_id', $wilayahId));
            })
                ->whereDate('tanggal_target', today())
                ->count(),

            'latestVisits' => DailyVisit::when($wilayahId, function ($q) use ($wilayahId) {
                return $q->whereHas('dokter', fn($sub) => $sub->where('wilayah_id', $wilayahId));
            })
                ->latest()
                ->with(['dokter', 'instansi'])
                ->take(10)
                ->get(),

            'chartLabels' => $chartLabels,
            'chartData' => $chartData,
            'allWilayah' => Wilayah::orderBy('wilayah')->get(),
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
