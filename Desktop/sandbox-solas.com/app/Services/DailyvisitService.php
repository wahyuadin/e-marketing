<?php

namespace App\Services;

use App\Models\Absensi;
use App\Models\DailyVisit;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use RealRashid\SweetAlert\Facades\Alert;

class DailyvisitService
{
    public function create($request)
    {
        $request->validate([
            'dokter_id' => 'required|exists:dokters,id',
            'waktu_kunjungan' => 'required|string|max:50',
            'keperluan' => 'required|string|max:50',
            'keterangan' => 'required|image|mimes:jpeg,png,jpg,gif|max:6144',
        ], [
            'dokter_id.required' => 'Dokter harus diisi',
            'dokter_id.exists' => 'Dokter tidak ditemukan',
            'waktu_kunjungan.required' => 'Waktu kunjungan harus diisi',
            'waktu_kunjungan.string' => 'Waktu kunjungan harus berupa string',
            'waktu_kunjungan.max' => 'Waktu kunjungan maksimal 50 karakter',
            'keperluan.required' => 'Keperluan harus diisi',
            'keperluan.string' => 'Keperluan harus berupa string',
            'keperluan.max' => 'Keperluan maksimal 50 karakter',
            'keterangan.required' => 'Keterangan harus diisi',
            'keterangan.image' => 'Keterangan harus berupa gambar',
            'keterangan.mimes' => 'Keterangan harus berupa JPEG, PNG, JPG, atau GIF',
            'keterangan.max' => 'Keterangan maksimal 6 MB',
        ]);

        $data = $request->except('_token');
        $data['user_id'] = Auth::user()->id;
        if ($request->hasFile('keterangan')) {
            $hasName        = $request->file('keterangan')->hashName();
            $request->file('keterangan')->move(public_path('assets/dailyvisit'), $hasName);
            $data['keterangan']   = $hasName;
        }

        try {
            DB::beginTransaction();
            DailyVisit::create($data);
            DB::commit();
            Alert::success('Sukses', 'Data berhasil disimpan');
        } catch (\Throwable $th) {
            DB::rollBack();
            Alert::error('Kesalahan', 'Data gagal disimpan');
            throw $th;
        }
    }

    public function update($request, $id)
    {
        $request->validate([
            'dokter_id' => 'required|exists:dokters,id',
            'waktu_kunjungan' => 'required|string|max:50',
            'keperluan' => 'required|string|max:50',
            'keterangan' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:6144',
        ]);

        $data = $request->except('_token');
        if ($request->hasFile('keterangan')) {
            $hasName        = $request->file('keterangan')->hashName();
            $request->file('keterangan')->move(public_path('assets/dailyvisit'), $hasName);
            $data['keterangan']   = $hasName;
        }

        try {
            DB::beginTransaction();
            $data['status'] = 'selesai';
            $data['tanggal_realisasi'] = date('Y-m-d');
            DailyVisit::find($id)->update($data);
            DB::commit();
            Alert::success('Sukses', 'Data berhasil diubah');
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
            DailyVisit::find($id)->delete();
            Alert::success('Sukses', 'Data berhasil dihapus');
            DB::commit();
        } catch (\Throwable $th) {
            DB::rollBack();
            Alert::error('Kesalahan', 'Data gagal dihapus');
            throw $th;
        }
    }
}
