<?php

namespace App\Services;

use App\Models\BugReport;
use Illuminate\Support\Facades\DB;
use RealRashid\SweetAlert\Facades\Alert;

class BugReportService
{

    public function create($request)
    {
        $request->validate([
            'title' => 'required|string',
            'content' => 'required|string',
            'gambar' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:6048',
        ]);

        $data = $request->except('_token');
        $data['user_id'] = auth()->user()->id;

        if ($request->hasFile('gambar')) {
            $hasName        = $request->file('gambar')->hashName();
            $request->file('gambar')->move(public_path('assets/bug'), $hasName);
            $data['gambar']   = $hasName;
        }
        try {
            DB::beginTransaction();
            BugReport::create($data);
            Alert::success('Sukses', 'Data berhasil disimpan');
            DB::commit();
        } catch (\Throwable $th) {
            DB::rollBack();
            Alert::error('Kesalahan', 'Data gagal disimpan');
            throw $th;
        }
    }

    public function update($request, $id)
    {
        $request->validate([
            'title' => 'required|string',
            'content' => 'required|string',
            'gambar' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:6048',
        ]);
        $data = $request->except('_token', '_method');
        $data['user_id'] = auth()->user()->id;

        try {
            DB::beginTransaction();
            BugReport::where('id', $id)->update($data);
            Alert::success('Sukses', 'Data berhasil diubah');
            DB::commit();
        } catch (\Throwable $th) {
            DB::rollBack();
            Alert::error('Kesalahan', 'Data gagal diubah');
            throw $th;
        }
    }

    public function delete($id)
    {
        try {
            DB::beginTransaction();
            BugReport::find($id)->delete();
            Alert::success('Sukses', 'Data berhasil dihapus');
            DB::commit();
        } catch (\Throwable $th) {
            DB::rollBack();
            Alert::error('Kesalahan', 'Data gagal dihapus');
            throw $th;
        }
    }
}
