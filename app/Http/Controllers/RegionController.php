<?php

namespace App\Http\Controllers;

use App\Models\Region;
use Illuminate\Http\Request;
use App\Services\RegionService;

class RegionController extends Controller
{
    protected $region;
    public function __construct(RegionService $region)
    {
        $this->region = $region;
    }

    public function index()
    {
        confirmDelete('Hapus Data', 'Apakah anda yakin ingin menghapus data ini?');
        return view('superadmin.region.index', ['data' => Region::showData()]);
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
        $this->region->create($request);
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
        $this->region->delete($id);
        return redirect()->back();
    }
}
