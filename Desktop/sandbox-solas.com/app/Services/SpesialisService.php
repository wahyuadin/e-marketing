<?php

namespace App\Services;

use App\Models\Spesialis;
use Illuminate\Support\Facades\DB;
use RealRashid\SweetAlert\Facades\Alert;

class SpesialisService
{

    public function create($request)
    {
        $request->validate([
            'spesialis' => 'required|string|max:255|unique:spesialis.spesialis',
        ], [
            'spesialis.required' => 'Spesialis harus diisi',
            'spesialis.max' => 'Spesialis maksimal 255 karakter',
            'spesialis.string' => 'Spesialis harus berupa string',
            'spesialis.unique' => 'Spesialis sudah ada',
        ]);

        try {
            DB::beginTransaction();
            Spesialis::create($request->all());
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
            'spesialis' => 'required|string|max:255',
        ], [
            'spesialis.required' => 'Spesialis harus diisi',
            'spesialis.max' => 'Spesialis maksimal 255 karakter',
            'spesialis.string' => 'Spesialis harus berupa string',
        ]);

        try {
            DB::beginTransaction();
            Spesialis::find($id)->update($request->all());
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
            Spesialis::find($id)->delete();
            Alert::success('Sukses', 'Data berhasil dihapus');
            DB::commit();
        } catch (\Throwable $th) {
            DB::rollBack();
            Alert::error('Kesalahan', 'Data gagal dihapus');
            throw $th;
        }
    }
}
