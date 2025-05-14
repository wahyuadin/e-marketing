<?php

namespace App\Services;

use App\Models\ApprovalHistory;
use App\Models\PengajuanDokter;
use App\Models\User;
use App\Models\Wilayah;
use Illuminate\Support\Facades\DB;
use RealRashid\SweetAlert\Facades\Alert;

class PengajuanDokterService
{
    public function create($request)
    {
        $request->validate([
            'instansi_id' => 'required|exists:instansis,id',
            'spesialis_id' => 'required|exists:spesialis,id',
            'wilayah_id' => 'required|exists:wilayahs,id',
            'dokter' => 'required|string|max:50|unique:pengajuan_dokters,dokter,NULL,id,deleted_at,NULL',
            'email' => 'required|email|unique:pengajuan_dokters,email,NULL,id,deleted_at,NULL|max:50|unique:pengajuan_dokters,email,NULL,id,deleted_at,NULL',
            'no_hp' => 'required|string|max:20|unique:pengajuan_dokters,no_hp,NULL,id,deleted_at,NULL',
            'alamat_rumah' => 'nullable|string|max:150',
            'alamat_praktek' => 'nullable|string|max:150',
            'bank_1' => 'required|string|max:50',
            'bank_2' => 'nullable|string|max:50',
            'bank_3' => 'nullable|string|max:50',
            'atas_nama_1' => 'required|string|max:50',
            'atas_nama_2' => 'nullable|string|max:50',
            'atas_nama_3' => 'nullable|string|max:50',
            'rekening_1' => 'required|string|max:50',
            'rekening_2' => 'nullable|string|max:50',
            'rekening_3' => 'nullable|string|max:50',
        ], [
            'instansi_id.required' => 'Instansi harus diisi',
            'spesialis_id.required' => 'Spesialis harus diisi',
            'wilayah_id.required' => 'Wilayah harus diisi',
            'dokter.required' => 'Dokter harus diisi',
            'email.required' => 'Email harus diisi',
            'no_hp.required' => 'No HP harus diisi',
            'bank_1.required' => 'Bank 1 harus diisi',
            'atas_nama_1.required' => 'Atas Nama 1 harus diisi',
            'rekening_1.required' => 'Rekening 1 harus diisi',
            'dokter.unique' => 'Dokter sudah ada',
            'email.unique' => 'Email sudah ada',
            'no_hp.unique' => 'No HP sudah ada',
        ]);

        $data = $request->all();
        $data['user_id'] = auth()->user()->id;
        try {
            DB::beginTransaction();
            $PengajuanDokter = PengajuanDokter::create($data);
            if ($PengajuanDokter) {
                $wilayah = Wilayah::where('id', $request->wilayah_id)->with('user')->first();
                ApprovalHistory::create([
                    'pengajuan_dokter_id' => $PengajuanDokter->id,
                    'appoval_1' => User::where('nip', '11223344')->value('nama'),
                    'appoval_2' => $wilayah->user->nama,
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
        //
    }

    public function delete($id)
    {
        try {
            DB::beginTransaction();
            PengajuanDokter::find($id)->delete();
            Alert::success('Sukses', 'Data berhasil dihapus');
            DB::commit();
        } catch (\Throwable $th) {
            DB::rollBack();
            Alert::error('Kesalahan', 'Data gagal dihapus');
            throw $th;
        }
    }

    public function approve($request, $id)
    {
        $request->validate([
            'appoval_1' => 'required|string',
            'appoval_2' => 'required|string',
            'status_appoval_1' => 'nullable|string',
            'status_appoval_2' => 'nullable|string',
        ]);


        try {
            $data = $request->except(['_token', '_method']);
            $data['pengajuan_dokter_id'] = $id;
            DB::beginTransaction();
            $create = ApprovalHistory::create($data);

            $status1 = $create->status_appoval_1;
            $status2 = $create->status_appoval_2;

            if ($status1 === 'rejected' || $status2 === 'rejected') {
                $status = 'rejected';
            } elseif ($status1 === 'approved' && $status2 === 'approved') {
                $status = 'approved';
            } else {
                $status = 'pending';
            }

            if ($status) {
                PengajuanDokter::where('id', $id)->update([
                    'status' => $status
                ]);
            }
            DB::commit();
            Alert::success('Sukses', 'Data berhasil disimpan');
        } catch (\Throwable $th) {
            DB::rollBack();
            Alert::error('Kesalahan', $th->getMessage());
        }
    }
}
