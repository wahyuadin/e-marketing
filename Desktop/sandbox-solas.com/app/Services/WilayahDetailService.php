<?php

namespace App\Services;

use App\Models\WilayahDetail;
use Illuminate\Support\Facades\DB;
use RealRashid\SweetAlert\Facades\Alert;

class WilayahDetailService
{
    public function create($request)
    {
        $request->validate([
            'wilayah_id' => 'required|exists:wilayahs,id',
            'mr_id' => 'required|exists:users,id',
            'area_id' => 'required|exists:areas,id',
            'code' => 'required',
        ]);
        try {
            DB::beginTransaction();
            $mrIds = $request->mr_id;
            $areaIds = $request->area_id;
            $codes = $request->code;
            $wilayahId = $request->wilayah_id;

            $count = count($mrIds);

            for ($i = 0; $i < $count; $i++) {
                WilayahDetail::firstOrCreate([
                    'wilayah_id' => $wilayahId,
                    'user_id' => $mrIds[$i],
                    'area_id' => $areaIds[$i],
                    'kode_mr' => $codes[$i],
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
            'wilayah_id' => 'required|exists:wilayahs,id',
            'mr_id' => 'required|exists:users,id',
        ]);

        try {
            DB::beginTransaction();
            WilayahDetail::update($id, $request->all());
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
            WilayahDetail::find($id)->delete();
            Alert::success('Sukses', 'Data berhasil dihapus');
            DB::commit();
        } catch (\Throwable $th) {
            DB::rollBack();
            Alert::error('Kesalahan', 'Data gagal dihapus');
            throw $th;
        }
    }
}
