<?php

namespace App\Http\Controllers;

use App\Models\Region;
use App\Models\User;
use Illuminate\Http\Request;

class RekapitulasiController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //return Region::with('user', 'regiondetails.wilayah.user', 'regiondetails.wilayah.wilayahdetails.user', 'regiondetails.wilayah.wilayahdetails.area')->orderBy('region', 'asc')->get();
        return view('superadmin.rekapitulasi.index', ['data' => Region::with('user', 'regiondetails.wilayah.user', 'regiondetails.wilayah.wilayahdetails.user', 'regiondetails.wilayah.wilayahdetails.area')->orderBy('region', 'asc')->get()]);
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
