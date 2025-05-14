<?php

namespace App\Services;

use App\Models\Pengumuman;
use App\Models\Whatsapp;
use Illuminate\Support\Facades\DB;
use RealRashid\SweetAlert\Facades\Alert;

class WhatsappService
{

    public function create($request)
    {
        $request->validate([
            'nama' => 'nullable|string',
            'session' => 'nullable|string',
            'no_hp' => 'required|string',
        ]);

        $data = $request->except('_token');
        $data['session'] = substr(hash('sha256', $request->session), 0, 8);
        try {
            DB::beginTransaction();
            Whatsapp::create($request->all());
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
            'nama' => 'nullable|string',
            'session' => 'nullable|string',
            'no_hp' => 'required|string',

        ]);

        try {
            DB::beginTransaction();
            Whatsapp::where('id', $id)->update($request->except('_token', '_method'));
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
            Whatsapp::find($id)->delete();
            Alert::success('Sukses', 'Data berhasil dihapus');
            DB::commit();
        } catch (\Throwable $th) {
            DB::rollBack();
            Alert::error('Kesalahan', 'Data gagal dihapus');
            throw $th;
        }
    }
}
