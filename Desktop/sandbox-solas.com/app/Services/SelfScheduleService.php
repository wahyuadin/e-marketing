<?php

namespace App\Services;

use App\Models\DailyVisit;
use App\Models\SelfSchedule;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use RealRashid\SweetAlert\Facades\Alert;
use Illuminate\Support\Str;


class SelfScheduleService
{

    public function create($request)
    {
        $request->validate([
            'tanggal' => 'required|array',
            'tanggal.*' => 'date',
            'keterangan' => 'required|array',
            'keterangan.*' => 'string',
            'dokter_id' => 'required|array',
            'instansi_id' => 'required|array',
            'instansi_id.*' => 'nullable|exists:instansis,id',
            'dokter_id.*' => 'nullable|exists:dokters,id',
        ]);
        try {
            DB::beginTransaction();
            $tanggal = $request->tanggal;
            $keterangan = $request->keterangan;
            $user_id = Auth::user()->id;
            $count = count($keterangan);

            for ($i = 0; $i < $count; $i++) {
                $dokterId = $request->dokter_id[$i] ?? null;
                $instansiId = $request->instansi_id[$i] ?? null;

                $dailyvisit = DailyVisit::create([
                    'user_id' => $user_id,
                    'dokter_id' => $dokterId,
                    'instansi_id' => $instansiId,
                    'tanggal_target' => \Carbon\Carbon::createFromFormat('Y-m-d', $tanggal[$i])->format('Y-m-d'),
                ]);

                if ($dailyvisit) {
                    SelfSchedule::create([
                        'user_id' => $user_id,
                        'daily_visit_id' => $dailyvisit->id,
                        'tanggal' => \Carbon\Carbon::createFromFormat('Y-m-d', $tanggal[$i])->format('Y-m-d'),
                        'keterangan' => $keterangan[$i],
                    ]);
                }
            }
            Alert::success('Sukses', 'Data berhasil ditambahkan');
            DB::commit();
        } catch (\Throwable $th) {
            DB::rollBack();
            dd($th);
            Alert::error('Kesalahan', $th->getMessage());
            throw $th;
        }

        return redirect()->back();
    }

    public function update($request, $id)
    {
        //
    }

    public function delete($id)
    {
        try {
            DB::beginTransaction();
            SelfSchedule::find($id)->delete();
            Alert::success('Sukses', 'Data berhasil dihapus');
            DB::commit();
        } catch (\Throwable $th) {
            DB::rollBack();
            Alert::error('Kesalahan', 'Data gagal dihapus');
            throw $th;
        }
    }

    public function events()
    {
        if (Auth::user()->role == 'superadmin' || Auth::user()->role == 'admin') {
            $events = SelfSchedule::showData();
        } else {
            $events = SelfSchedule::showData(Auth::user()->id);
        }
        return $events->map(function ($item) {
            return [
                'title' => $item->keterangan ?? 'Self Schedule',
                'start' => $item->tanggal,
                'dokter' => $item->DailyVisit->dokter->dokter ?? 'Dokter tidak ditemukan',
                'keterangan' => $item->keterangan,
                'instansi' => $item->DailyVisit->instansi->instansi ?? 'Instansi tidak ditemukan',
                'color' => $this->getStatusColor($item->status),
            ];
        });
    }

    private function getStatusColor($status)
    {
        return match ($status) {
            'selesai' => 'green',
            'progress' => 'blue',
            'tidak_terpenuhi' => 'red',
            default => 'gray',
        };
    }
}
