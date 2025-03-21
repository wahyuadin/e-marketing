<?php

namespace Database\Seeders;

use App\Models\Instansi;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class InstansiSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Instansi::create([
            'instansi' => 'RS PRIMAYA LANGGEN SEJAHTERA',
            'alamat' => 'Jl. Raya Langgen Sejahtera No. 1, Langgen Sejahtera, Kec. Langgen Sejahtera, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55281',
            'no_hp' => '08123456789',
            'email' => 'solas.id',
            'kategori' => 'rs',
        ]);
    }
}
