<?php

namespace App\Http\Controllers;

use App\Models\Pengumuman;
use App\Services\PengumumanService;
use Illuminate\Http\Request;

class PengumumanController extends Controller
{
    protected $pengumuman;

    public function __construct(PengumumanService $pengumuman)
    {
        $this->pengumuman = $pengumuman;
    }

    public function index()
    {
        confirmDelete('Peringatan', 'Apakah anda yakin ingin menghapus data ini?');
        return view('superadmin.pengumuman.index', ['data' => Pengumuman::showData()]);
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
        $this->pengumuman->create($request);
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
        $this->pengumuman->update($request, $id);
        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $this->pengumuman->delete($id);
        return redirect()->back();
    }
}
