<?php

namespace App\Http\Controllers;

use App\Models\Absensi;
use App\Services\AbsesnsiService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AbsensiController extends Controller
{
    protected $absensi;
    public function __construct(AbsesnsiService $absensi)
    {
        $this->absensi = $absensi;
    }

    public function index()
    {
        confirmDelete('Hapus Data', 'Apakah anda yakin ingin menghapus data ini?');
        if (Auth::user()->role == 'superadmin') {
            return view('superadmin.absensi.index', ['data' => Absensi::showData()]);
        }
        return view('superadmin.absensi.index', ['data' => Absensi::showData(Auth::user()->id)]);
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
        $this->absensi->create($request);
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
        $this->absensi->update($request, $id);
        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $this->absensi->delete($id);
        return redirect()->back();
    }
}
