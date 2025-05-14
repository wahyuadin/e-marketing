<?php

namespace App\Services;

use App\Models\Dokter;
use Illuminate\Support\Facades\DB;
use RealRashid\SweetAlert\Facades\Alert;

class DokterService
{

    public function create($request)
    {
        $request->validate([
            'dokter' => 'required|string|max:255',
            'email' => 'required|email|max:255|unique:dokters,email,NULL,id,deleted_at,NULL',
            'wilayah_id' => 'required|exists:wilayahs,id',
            'instagram' => 'nullable|string|max:255',
            'no_hp' => 'required|min:10|max:20',
            'alamat_rumah' => 'nullable|string',
            'alamat_praktek' => 'nullable|string',
            'bank_1' => 'required|string|max:255',
            'rekening_1' => 'required|string|max:255',
            'bank_2' => 'nullable|string|max:255',
            'rekening_2' => 'nullable|string|max:255',
            'instansi_id' => 'required|exists:instansis,id',
            'spesialis_id' => 'required|exists:spesialis,id',
        ]);

        try {
            DB::beginTransaction();
            Dokter::create($request->all());
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
            'dokter' => 'required|string|max:255',
            'email' => 'required|email|max:255',
            'wilayah_id' => 'required|exists:wilayahs,id',
            'instagram' => 'nullable|string|max:255',
            'no_hp' => 'required|min:10|max:20',
            'alamat_rumah' => 'nullable|string',
            'alamat_praktek' => 'nullable|string',
            'bank_1' => 'required|string|max:255',
            'rekening_1' => 'required|string|max:255',
            'bank_2' => 'nullable|string|max:255',
            'rekening_2' => 'nullable|string|max:255',
            'instansi_id' => 'required|exists:instansis,id',
            'spesialis_id' => 'required|exists:spesialis,id',
        ]);

        try {
            DB::beginTransaction();
            Dokter::find($id)->update($request->all());
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
            Dokter::find($id)->delete();
            Alert::success('Sukses', 'Data berhasil dihapus');
            DB::commit();
        } catch (\Throwable $th) {
            DB::rollBack();
            Alert::error('Kesalahan', 'Data gagal dihapus');
            throw $th;
        }
    }
}
