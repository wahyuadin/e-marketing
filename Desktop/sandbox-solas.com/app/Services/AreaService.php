<?php

namespace App\Services;

use App\Models\Absensi;
use App\Models\Area;
use App\Models\RegionDetail;
use Illuminate\Support\Facades\DB;
use RealRashid\SweetAlert\Facades\Alert;

class AreaService
{
    public function create($request)
    {
        $request->validate(
            [
                'area' => 'required|unique:areas,area',
            ],
            [
                'area.required' => 'Area harus diisi',
                'area.unique' => 'Area sudah ada',
            ]
        );

        try {
            DB::beginTransaction();
            Area::create($request->all());
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
        $request->validate(
            [
                'area' => 'required',
            ],
            [
                'area.required' => 'Area harus diisi',
            ]
        );

        try {
            DB::beginTransaction();
            Area::find($id)->update($request->all());
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
            Area::find($id)->delete();
            Alert::success('Sukses', 'Data berhasil dihapus');
            DB::commit();
        } catch (\Throwable $th) {
            DB::rollBack();
            Alert::error('Kesalahan', 'Data gagal dihapus');
            throw $th;
        }
    }
}
