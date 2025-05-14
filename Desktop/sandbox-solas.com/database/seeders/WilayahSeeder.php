<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\Wilayah;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class WilayahSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $wilayah = [
            'SULSEL 1',
            'SULSEL 2',
            'SULTRA',
            'MALUKU',
            'SULUT',
            'GORONTALO',
            'SULTENG',
            'JATIM 1',
            'JATIM 4',
            'JATIM 5',
            'JATIM 6',
            'JATIM 7',
            'BALI',
            'NUSRA 1',
            'NUSRA 2',
            'KALSEL 1',
            'KALSEL 2',
            'KALSEL 3',
            'KALTENG 1',
            'KALTENG 2',
            'KALTIM',
            'JATENG - 01',
            'JATENG - 02',
            'JATENG - 03',
            'JATENG - 04',
            'JATENG - 05',
            'JATENG - 06',
            'JABAR 1',
            'JABAR 2',
            'JABAR 3',
            'JABAR 4',
            'DKI 1',
            'DKI 2',
            'DKI 3',
            'DKI 4',
            'DKI 5',
            'KALBAR',
            'DKI 7',
            'BTN 1',
            'BTN 2',
            'LAMPUNG',
            'PALEMBANG',
            'SUMUT 1',
            'SUMUT 2',
            'SUMUT 3',
            'SUMUT 4',
            'SUMUT 5',
            'ACEH',
            'PEKANBARU',
            'JAMBI',
            'PADANG',
        ];

        $user = User::where('role', 'superadmin')->first();
        foreach ($wilayah as $value) {
            Wilayah::create([
                'user_id' => $user->id,
                'wilayah' => $value,
            ]);
        }
    }
}
