<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Superadmin
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

        // Daftar user berdasarkan role
        $rsm = ['Felix Liyadi'];
        $am = [
            'Edi Sutoyo',
            'Kadir',
            'Alexander',
            'Anton Andreas',
            'Andy Putra Yunior',
            'Sandy Andreas Koropit',
            'I Wayan Sutama',
            'Vaisal',
            'Florida Emelia Djami',
        ];
        $mr = [
            'Ahmad Irsyiadi Rahim',
            'Ade Apriathis Rantelino',
            'Yuditya Kusumawardhani',
            'Yuni Kartika',
            'Irwansyah',
            'Hardiyanto Biring',
            'Halimudin',
            'Iin Indriani',
            'Thomas Telapary',
            'Muhammad Rizky Jamiddin Morishita',
            'Fadliyah Korompot',
            'Rully Fadly Mandagie',
            'Imam F Thaib',
        ];

        $users = [
            ['list' => $rsm, 'role' => 'rsm'],
            ['list' => $am, 'role' => 'am'],
            ['list' => $mr, 'role' => 'mr'],
        ];

        $nipCounter = 1000;

        User::create([
            'nip' => '2025',
            'password' => bcrypt('password'),
            'nama' => 'Vacant',
            'alamat' => 'PT SOLAS LANGGENG SEJAHTERA',
            'status' => 'active',
            'role' => 'mr',
            'no_hp' => '08' . rand(1000000000, 9999999999),
            'email' => 'vacant@solas.id',
            'foto' => 'default.png',
        ]);
        foreach ($users as $group) {
            foreach ($group['list'] as $name) {
                User::create([
                    'nip' => $nipCounter++,
                    'password' => bcrypt('password'),
                    'nama' => $name,
                    'alamat' => 'PT SOLAS LANGGENG SEJAHTERA',
                    'status' => 'active',
                    'role' => $group['role'],
                    'no_hp' => '08' . rand(1000000000, 9999999999),
                    'email' => Str::slug($name, '.') . '@solas.id',
                    'foto' => 'default.png',
                ]);
            }
        }
    }
}
