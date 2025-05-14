<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class DailyVisit extends Model
{
    use HasFactory, HasUuids, SoftDeletes;
    protected $guarded = [];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function dokter()
    {
        return $this->belongsTo(Dokter::class);
    }

    public function instansi()
    {
        return $this->belongsTo(Instansi::class);
    }

    public static function showData($id = null)
    {
        return $id ? self::where('user_id', $id)->with('user', 'instansi', 'dokter.spesialis', 'dokter.instansi')->latest()->get() : self::with('user', 'instansi', 'dokter.spesialis', 'dokter.instansi')->latest()->get();
    }

    public static function showDataByAm($amId)
    {
        return self::whereHas('user.wilayahDetail.wilayah.user', function ($query) use ($amId) {
            $query->where('id', $amId);
        })
            ->with('user.wilayahDetail.area', 'user.wilayahDetail.wilayah.user', 'user.wilayahDetail.wilayah.regionalDetail.region.user')
            ->latest()
            ->get();
    }
}
