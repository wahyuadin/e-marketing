<?php

namespace App\Http\Controllers;

use App\Models\Region;
use App\Models\RegionDetail;
use App\Services\RegionDetailService;
use Illuminate\Http\Request;

class RegiondetailController extends Controller
{
    protected $regionDetail;
    public function __construct(RegionDetailService $regionDetail)
    {
        $this->regionDetail = $regionDetail;
    }

    public function index()
    {
        //
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
        $this->regionDetail->create($request);
        return redirect()->back();
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        confirmDelete('Hapus Data', 'Apakah anda yakin ingin menghapus data ini?');
        return view('superadmin.region.detail.index', [
            'data' => RegionDetail::showData($id),
            'title' => Region::find($id)
        ]);
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
        $this->regionDetail->update($request, $id);
        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $this->regionDetail->delete($id);
        return redirect()->back();
    }
}
