<?php

namespace App\Services;

use App\Models\Instansi;
use Illuminate\Support\Facades\DB;
use RealRashid\SweetAlert\Facades\Alert;

class InstansiService
{

    public function create($request)
    {
        $request->validate([
            'instansi' => 'required|string|max:255',
            'alamat' => 'required|string',
            'email' => 'required|email|max:255|unique:instansis,email,NULL,id,deleted_at,NULL',
            'no_hp' => 'required|string|max:20',
            'kategori' => 'required|in:apotek,rs',
        ], [
            'instansi.required' => 'Instansi harus diisi',
            'alamat.required' => 'Alamat harus diisi',
            'email.required' => 'Email harus diisi',
            'email.unique' => 'Email sudah terdaftar',
            'no_hp.required' => 'No HP harus diisi',
            'kategori.required' => 'Kategori harus diisi',
            'kategori.in' => 'Kategori tidak valid',
        ]);

        try {
            DB::beginTransaction();
            Instansi::create($request->all());
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
            'instansi' => 'required|string|max:255',
            'alamat' => 'required|string',
            'email' => 'required|email|max:255',
            'no_hp' => 'required|string|max:20',
            'kategori' => 'required|in:apotek,rs',
        ], [
            'instansi.required' => 'Instansi harus diisi',
            'alamat.required' => 'Alamat harus diisi',
            'email.required' => 'Email harus diisi',
            'no_hp.required' => 'No HP harus diisi',
            'kategori.required' => 'Kategori harus diisi',
            'kategori.in' => 'Kategori tidak valid',
        ]);

        try {
            DB::beginTransaction();
            Instansi::find($id)->update($request->all());
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
            Instansi::find($id)->delete();
            Alert::success('Sukses', 'Data berhasil dihapus');
            DB::commit();
        } catch (\Throwable $th) {
            DB::rollBack();
            Alert::error('Kesalahan', 'Data gagal dihapus');
            throw $th;
        }
    }
}
