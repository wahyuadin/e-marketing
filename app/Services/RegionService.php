<?php

namespace App\Services;

use App\Models\Region;
use Illuminate\Support\Facades\DB;
use RealRashid\SweetAlert\Facades\Alert;

class RegionService
{

    public function create($request)
    {
        $request->validate([
            'user_id' => 'required|exists:users,id',
            'region' => 'required',
        ], [
            'user_id.required' => 'User tidak boleh kosong',
            'user_id.exists' => 'User tidak ditemukan',
            'region.required' => 'Region tidak boleh kosong',
        ]);

        try {
            DB::beginTransaction();
            Region::create($request->all());
            Alert::success('Sukses', 'Data berhasil ditambahkan');
            DB::commit();
        } catch (\Throwable $th) {
            DB::rollBack();
            Alert::error('Kesalahan', 'Data gagal ditambahkan');
            throw $th;
        }
        return redirect()->back();
    }

    public function update($request, $id)
    {
        $request->validate([
            'user_id' => 'required|exists:users,id',
            'region' => 'required',
        ], [
            'user_id.required' => 'User tidak boleh kosong',
            'user_id.exists' => 'User tidak ditemukan',
            'region.required' => 'Region tidak boleh kosong',
        ]);

        try {
            DB::beginTransaction();
            Region::find($id)->update($request->all());
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
            Region::find($id)->delete();
            Alert::success('Sukses', 'Data berhasil dihapus');
            DB::commit();
        } catch (\Throwable $th) {
            DB::rollBack();
            Alert::error('Kesalahan', 'Data gagal dihapus');
            throw $th;
        }
    }
}
