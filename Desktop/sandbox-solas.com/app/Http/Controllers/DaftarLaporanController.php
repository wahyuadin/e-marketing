<?php

namespace App\Http\Controllers;

use App\Models\Absensi;
use App\Models\DailyVisit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DaftarLaporanController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        if (Auth::user()->role == 'am') {
            return view('superadmin.daftar-laporan.index', ['absensi' => Absensi::showDataByAm(Auth::user()->id), 'dailyvisit' => DailyVisit::showDataByAm(Auth::user()->id)]);
        }
        return view('superadmin.daftar-laporan.index', ['absensi' => Absensi::showData(), 'dailyvisit' => DailyVisit::showData()]);
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
