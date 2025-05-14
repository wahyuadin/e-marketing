<?php

namespace App\Http\Controllers;

use App\Models\Instansi;
use App\Services\InstansiService;
use Illuminate\Http\Request;

class InstansiController extends Controller
{
    protected $instansi;
    public function __construct(InstansiService $instansi)
    {
        $this->instansi = $instansi;
    }

    public function index()
    {
        confirmDelete('Hapus Data', 'Apakah anda yakin ingin menghapus data ini?');
        return view('superadmin.instansi.index', ['data' => Instansi::showData()]);
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
        $this->instansi->create($request);
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
        $this->instansi->update($request, $id);
        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $this->instansi->delete($id);
        return redirect()->back();
    }
}
