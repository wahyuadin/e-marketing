<?php

namespace App\Http\Controllers;

use App\Models\Spesialis;
use App\Services\SpesialisService;
use Illuminate\Http\Request;

class SpesialisController extends Controller
{
    protected $spesialis;
    public function __construct(SpesialisService $spesialis)
    {
        $this->spesialis = $spesialis;
    }

    public function index()
    {
        confirmDelete('Hapus Data', 'Apakah anda yakin ingin menghapus data ini?');
        return view('superadmin.spesialis.index', ['data' => Spesialis::showData()]);
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
        $this->spesialis->create($request);
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
        $this->spesialis->update($request, $id);
        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $this->spesialis->delete($id);
        return redirect()->back();
    }
}
