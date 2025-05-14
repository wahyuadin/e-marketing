<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Absensi extends Model
{
    use HasFactory, HasUuids, SoftDeletes;
    protected $guarded = [];

    public function user()
    {
        return $this->belongsTo(User::class);
    }


    public static function showData($id = null)
    {
        return $id ? self::where('user_id', $id)->with('user.wilayahDetail.area', 'user.wilayahDetail.wilayah.user', 'user.wilayah')->latest()->get() :
        self::with('user.wilayahDetail.area', 'user.wilayahDetail.wilayah.user', 'user.wilayah.regionalDetail.region.user', 'user.wilayah.wilayahdetails.area', 'user.wilayahDetail.wilayah.regionalDetail.region.user')->latest()->get();
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
