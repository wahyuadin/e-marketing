<?php

namespace Database\Seeders;

use App\Models\Jabatan;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class JabatanSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $jabatans = ['MR', 'AM', 'RSM', 'NSM', 'Admin'];

        foreach ($jabatans as $jabatan) {
            Jabatan::create(['jabatan' => $jabatan]);
        }
    }
}
