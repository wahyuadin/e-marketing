<?php

namespace Database\Seeders;

use App\Models\Spesialis;
use Illuminate\Support\Str;
use Illuminate\Database\Seeder;

class SpesialiSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $data = [
            'General Practitioner - dr',
            'Spesialis Anak - Sp.A.',
            'Spesialis Anestesiologi Dan Reanimasi - Sp.B.',
            'Spesialis Bedah Anak - Sp.BA',
            'Spesialis Bedah Digestif - Sp.B, Subsp.BD(K)',
            'Spesialis Bedah Onkologi - Sp.B(K) Onk',
            'Spesialis Bedah Ortopedi Dan Traumatologi - Sp.OT',
            'Spesialis Bedah Mulut - Sp.BM',
            'Spesialis Bedah Plastik - Sp.BP',
            'Spesialis Bedah Syaraf - Sp.BS',
            'Spesialis Bedah Toraks Kardiovaskuler - Sp.BTKV',
            'Spesialis Geriatri - Sp.Ger.',
            'Spesialis Jantung Dan Pembuluh Darah - Sp.JP',
            'Spesialis Kedaruratan Medik - Sp.EM',
            'Spesialis Kedokteran Forensik - Sp.F',
            'Spesialis Kedokteran Jiwa Dan Psikiater - Sp.KJ',
            'Spesialis Kedokteran Nuklir - Sp.KN',
            'Spesialis Kedokteran Okupasi - Sp.Ok.',
            'Spesialis Kedokteran Olahraga - Sp.KO',
            'Spesialis Mata - Sp.M.',
            'Spesialis Mikrobiologi Klinik - Sp.MK',
            'Spesialis Obstetri Dan Ginekologi - Sp.OG',
            'Spesialis Onkologi Radiasi - Sp.Onk.Rad.',
            'Spesialis Onkologi - Sp.Onk',
            'Spesialis Paru - Sp.P.',
            'Spesialis Patologi Anatomi - Sp.PA',
            'Spesialis Patologi Klinik - Sp.PK',
            'Spesialis Penyakit Dalam - Sp.PD',
            'Spesialis Pulmonologi - Sp.PD-KP',
            'Spesialis Penyakit Kulit Dan Kelamin - Sp.KK',
            'Spesialis Dermatovenerologi - Sp.DV',
            'Spesialis Penyakit Mulut - Sp.PM',
            'Spesialis Periodonsia - Sp.Perio.',
            'Spesialis Radiologi - Sp.RM',
            'Spesialis Saraf Atau Neurologi - Sp.S.',
            'Spesialis Telinga, Hidung, Tenggorokan - Sp.THT',
            'Spesialis Urologi - Sp.U.',
            'Dokter Gigi - Drg',
            'Spesialis Gigi Anak - Sp.KGA',
            'Spesialis Ilmu Kedokteran Fisik dan Rehabilitasi - Sp.KFR',
            'Spesialis Andrologi - Sp.And',
            'Spesialis Kardiologi - Sp.PD-KKV',
            'Spesialis Farmakologi Klinik - Sp.FK',
            'Spesialis Fisioterapi - S.FT',
            'Spesialis Gizi Klinik - Sp.GK',
            'Spesialis Bedah Urologi - Sp.BU.',
            'Spesialis Radiologi - Sp.Rad',
        ];

        $formattedData = array_map(fn($item) => [
            'id' => Str::uuid(),
            'spesialis' => trim($item)
        ], $data);

        Spesialis::insert($formattedData);
    }
}
