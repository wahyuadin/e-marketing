<?php

namespace App\Http\Controllers;

use App\Models\BugReport as ModelsBugReport;
use App\Services\BugReportService;
use Illuminate\Http\Request;

class BugReport extends Controller
{
    protected $bugReport;
    public function __construct(BugReportService $bugReport)
    {
        $this->bugReport = $bugReport;
    }
    public function index()
    {
        return view('bug-report.index', ['data' => ModelsBugReport::showData()]);
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
        $this->bugReport->create($request);
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
