<?php

namespace App\Http\Controllers;

use App\Models\Whatsapp;
use App\Services\WhatsappService;
use Illuminate\Http\Request;

class WhatsappController extends Controller
{
    protected $whatsapp;

    public function __construct(WhatsappService $whatsapp)
    {
        $this->whatsapp = $whatsapp;
    }
    public function index()
    {
        confirmDelete('Peringatan', 'Apakah anda yakin ingin menghapus data ini?');
        return view('superadmin.whatsapp.index', ['data' => Whatsapp::showData()]);
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
        $this->whatsapp->create($request);
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
        $this->whatsapp->update($request, $id);
        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $this->whatsapp->delete($id);
        return redirect()->back();
    }
}
