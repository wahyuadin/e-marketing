<?php

namespace App\Services;

use App\Models\Pengumuman;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use RealRashid\SweetAlert\Facades\Alert;

class PengumumanService
{

    public function create($request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'content' => 'required|max:1000',
        ]);
        $data = $request->except('_token');
        $data['user_id'] = Auth::user()->id;
        try {
            DB::beginTransaction();
            Pengumuman::create($data);
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
            'title' => 'required|string|max:255',
            'content' => 'required|max:1000',
            'status' => 'required|in:draft,published',
        ]);

        $data = $request->except('_token', '_method');
        $data['user_id'] = auth()->user()->id;

        try {
            DB::beginTransaction();
            Pengumuman::where('id', $id)->update($data);
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
            Pengumuman::find($id)->delete();
            Alert::success('Sukses', 'Data berhasil dihapus');
            DB::commit();
        } catch (\Throwable $th) {
            DB::rollBack();
            Alert::error('Kesalahan', 'Data gagal dihapus');
            throw $th;
        }
    }
}
