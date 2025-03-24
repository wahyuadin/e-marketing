<?php

namespace App\Services;

use App\Models\Absensi;
use App\Models\RegionDetail;
use Illuminate\Support\Facades\DB;
use RealRashid\SweetAlert\Facades\Alert;

class AbsesnsiService
{
    public function create($request)
    {
        $request->validate([
            'waktu' => 'required|string',
            'keterangan' => 'required|string',
            'status' => 'required|string',
            'foto_marki' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:6144',
            'latitude' => 'nullable|string',
            'longitude' => 'nullable|string',
        ]);
        $data = $request->all();

        if ($request->hasFile('foto_marki')) {
            $nama        = $request->file('foto_marki')->hashName();
            $request->file('foto_marki')->move(public_path('assets/foto_marki'), $nama);
            $data['foto_marki']   = $nama;
        }

        $data['user_id'] = auth()->user()->id;
        $data['tanggal'] = date('Y-m-d');

        try {
            DB::beginTransaction();
            Absensi::create($data);
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
        //
    }

    public function delete($id)
    {
        try {
            DB::beginTransaction();
            Absensi::find($id)->delete();
            Alert::success('Sukses', 'Data berhasil dihapus');
            DB::commit();
        } catch (\Throwable $th) {
            DB::rollBack();
            Alert::error('Kesalahan', 'Data gagal dihapus');
            throw $th;
        }
    }
}
