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
            'keterangan' => 'required|string',
            'status' => 'nullable|string',
            'alasan' => 'nullable|string',
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
        $data['waktu'] = now()->format('H:i');
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
        $request->validate([
            'keterangan' => 'required|string|max:255',
            'status' => 'nullable|string|max:255',
            'alasan' => 'nullable|string|max:255',
            'foto_marki' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'latitude' => 'nullable',
            'longitude' => 'nullable',
        ]);

        $data = $request->except('_token', '_method');
        $data['waktu'] = now()->format('H:i');
        $data['user_id'] = auth()->user()->id;
        $data['tanggal'] = date('Y-m-d');
        if ($request->hasFile('foto_marki')) {
            $nama        = $request->file('foto_marki')->hashName();
            $request->file('foto_marki')->move(public_path('assets/foto_marki'), $nama);
            $data['foto_marki']   = $nama;
        }

        try {
            DB::beginTransaction();
            Absensi::where('id', $id)->update($data);
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
