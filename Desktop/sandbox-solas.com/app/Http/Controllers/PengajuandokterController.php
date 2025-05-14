<?php

namespace App\Http\Controllers;

use App\Models\PengajuanDokter;
use App\Services\PengajuanDokterService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PengajuandokterController extends Controller
{
    protected $pengajuandokter;
    public function __construct(PengajuanDokterService $pengajuandokter)
    {
        $this->pengajuandokter = $pengajuandokter;
    }
    public function index()
    {
        confirmDelete('Hapus Data', 'Apakah anda yakin ingin menghapus data ini?');
        if (Auth::user()->role == 'superadmin' || Auth::user()->role == 'admin') {
            return view('superadmin.pengajuan-dokter.index', ['data' => PengajuanDokter::showData()]);
        } elseif (Auth::user()->role == 'am') {
            return view('superadmin.pengajuan-dokter.index', ['data' => PengajuanDokter::showByAm(Auth::user()->id)]);
        }
        return view('superadmin.pengajuan-dokter.index', ['data' => PengajuanDokter::showData(Auth::user()->id)]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create() {}

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $this->pengajuandokter->create($request);
        return redirect()->back();
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
        $this->pengajuandokter->delete($id);
        return redirect()->back();
    }

    public function approve(Request $request, $id)
    {
        $this->pengajuandokter->approve($request, $id);
        return redirect()->back();
    }
}
