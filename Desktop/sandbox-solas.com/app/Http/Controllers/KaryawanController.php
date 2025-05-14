<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Services\KaryawanService;
use Illuminate\Http\Request;

class KaryawanController extends Controller
{
    protected $karyawan;
    public function __construct(KaryawanService $karyawan)
    {
        $this->karyawan = $karyawan;
    }
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        confirmDelete('Hapus Data', 'Apakah anda yakin ingin menghapus data ini?');
        return view('superadmin.karyawan.index', ['data' => User::showData()]);
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
        $this->karyawan->create($request);
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
        $this->karyawan->update($request, $id);
        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $this->karyawan->delete($id);
        return redirect()->back();
    }
}
