<?php

namespace App\Http\Controllers;

use App\Models\Wilayah;
use App\Models\WilayahDetail;
use App\Services\WilayahDetailService;
use Illuminate\Http\Request;

class WilayahdetailController extends Controller
{
    protected $wilayahDetail;
    public function __construct(WilayahDetailService $wilayahDetail)
    {
        $this->wilayahDetail = $wilayahDetail;
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
        $this->wilayahDetail->create($request);
        return redirect()->back();
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        confirmDelete('Hapus Data', 'Apakah anda yakin ingin menghapus data ini?');
        return view('superadmin.wilayah.detail.index', [
            'data'  => WilayahDetail::showData($id),
            'title' => Wilayah::where('id', $id)->first()
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
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $this->wilayahDetail->delete($id);
        return redirect()->back();
    }
}
