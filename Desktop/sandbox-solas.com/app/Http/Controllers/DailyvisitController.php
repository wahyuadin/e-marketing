<?php

namespace App\Http\Controllers;

use App\Models\DailyVisit;
use App\Services\DailyvisitService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DailyvisitController extends Controller
{
    protected $dailyvisit;
    public function __construct(DailyvisitService $dailyvisit)
    {
        $this->dailyvisit = $dailyvisit;
    }

    public function index()
    {
        confirmDelete('Hapus Data', 'Apakah anda yakin ingin menghapus data ini?');
        if (Auth::user()->role == 'superadmin' || Auth::user()->role == 'admin') {
            return view('superadmin.dailyvisit.index', ['data' => DailyVisit::showData()]);
        }
        return view('superadmin.dailyvisit.index', ['data' => DailyVisit::showData(Auth::user()->id)]);
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
        $this->dailyvisit->create($request);
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
        $this->dailyvisit->update($request, $id);
        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $this->dailyvisit->delete($id);
        return redirect()->back();
    }
}
