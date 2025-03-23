<?php

namespace Database\Seeders;

use App\Models\Jabatan;
use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        User::create([
            'nip' => '11223344',
            'password' => bcrypt('password'),
            'nama' => 'Super Admin',
            'alamat' => 'PT SOLAS LANGGENG SEJAHTERA',
            'status' => 'active',
            'role' => 'superadmin',
            'no_hp' => '081234567890',
            'email' => 'superadmin@solas.id',
            'foto' => 'default.png',
        ]);
    }
}
