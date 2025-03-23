<?php

namespace App\Services;

use App\Models\RegionDetail;
use Illuminate\Support\Facades\DB;
use RealRashid\SweetAlert\Facades\Alert;

class RegionDetailService
{
    public function create($request)
    {
        $request->validate([
            'region_id' => 'required|exists:regions,id',
            'wilayah_id' => 'required|exists:wilayahs,id',
        ]);
        try {
            DB::beginTransaction();
            foreach ($request->wilayah_id as $wilayahId) {
                RegionDetail::create([
                    'region_id' => $request->region_id,
                    'wilayah_id' => $wilayahId,
                ]);
            }
            Alert::success('Sukses', 'Data berhasil ditambahkan');
            DB::commit();
        } catch (\Throwable $th) {
            DB::rollBack();
            Alert::error('Kesalahan', 'Data gagal ditambahkan');
            throw $th;
        }
    }

    public function update($request, $id)
    {
        $request->validate([
            'region_id' => 'required|exists:regions,id',
            'wilayah_id' => 'required|exists:wilayahs,id',
        ]);

        try {
            DB::beginTransaction();
            RegionDetail::update($id, $request->all());
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
            RegionDetail::find($id)->delete();
            Alert::success('Sukses', 'Data berhasil dihapus');
            DB::commit();
        } catch (\Throwable $th) {
            DB::rollBack();
            Alert::error('Kesalahan', 'Data gagal dihapus');
            throw $th;
        }
    }
}
