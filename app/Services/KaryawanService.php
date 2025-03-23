<?php

namespace App\Services;

use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use RealRashid\SweetAlert\Facades\Alert;

class KaryawanService
{

    public function create($request)
    {
        $request->validate([
            'nama' => 'required',
            'alamat' => 'required|max:255',
            'no_hp' => 'required|min:10|max:13|unique:users,no_hp',
            'nip' => 'required|unique:users,nip',
            'email' => 'required|email|unique:users,email',
            'role' => 'required',
            'password' => 'required',
            'foto' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:6144',
        ], [
            'nip.unique' => 'NIP sudah terdaftar',
            'role.required' => 'Role harus dipilih',
            'email.unique' => 'Email sudah terdaftar',
            'no_hp.unique' => 'No HP sudah terdaftar',
            'no_hp.min' => 'No HP Minimum 10 angka',
            'no_hp.max' => 'No HP Maximum 13 angka',
            'no_hp.required' => 'No HP harus diisi',
        ]);

        $data = $request->except('_token');
        $data['password'] = Hash::make($data['password']);
        if ($request->hasFile('foto')) {
            $hasName        = $request->file('foto')->hashName();
            $request->file('foto')->move(public_path('assets/profile'), $hasName);
            $data['foto']   = $hasName;
        }

        try {
            DB::beginTransaction();
            User::create($data);
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
            'nama' => 'required',
            'alamat' => 'required|max:255',
            'no_hp' => 'required|max:13|unique:users,no_hp|regex:/^([0-9\s\-\+\(\)]+)$/|min:10|numeric',
            'nip' => 'required',
            'email' => 'required|email',
            'role' => 'required',
            'foto' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:6144',
        ], [
            'nip.unique' => 'NIP sudah terdaftar',
            'accept.required' => 'Role harus dipilih',
        ]);

        $data = $request->all();
        if ($request->hasFile('foto')) {
            $hasName        = $request->file('foto')->hashName();
            $request->file('foto')->move(public_path('assets/profile'), $hasName);
            $data['foto']   = $hasName;
        }

        try {
            DB::beginTransaction();
            User::find($id)->update($data);
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
            User::find($id)->delete();
            Alert::success('Sukses', 'Data berhasil dihapus');
            DB::commit();
        } catch (\Throwable $th) {
            DB::rollBack();
            Alert::error('Kesalahan', 'Data gagal dihapus');
            throw $th;
        }
    }
}
