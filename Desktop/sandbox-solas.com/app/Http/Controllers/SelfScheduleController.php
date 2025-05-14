<?php

namespace App\Http\Controllers;

use App\Models\SelfSchedule;
use App\Services\SelfScheduleService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class SelfScheduleController extends Controller
{
    protected $selfschedule;
    public function __construct(SelfScheduleService $selfschedule)
    {
        $this->selfschedule = $selfschedule;
    }
    public function index()
    {
        if (Auth::user()->role == 'superadmin' || Auth::user()->role == 'admin') {
            return view('superadmin.self-schedule.index', ['data' => SelfSchedule::showData()]);
        }
        return view('superadmin.self-schedule.index', ['data' => SelfSchedule::showData(Auth::user()->id)]);
    }

    public function getEvents()
    {
        return $this->selfschedule->events();
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
        return $this->selfschedule->create($request);
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
