<?php

namespace App\Http\Controllers;

use App\Models\Dokter;
use App\Services\DokterService;
use Illuminate\Http\Request;

class DokterController extends Controller
{
    protected $dokter;
    public function __construct(DokterService $dokter)
    {
        $this->dokter = $dokter;
    }
    public function index()
    {
        return view('superadmin.dokter.index', ['data' => Dokter::showData()]);
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
        $this->dokter->create($request);
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
        //
    }
}
