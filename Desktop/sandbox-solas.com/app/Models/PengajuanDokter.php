<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class PengajuanDokter extends Model
{
    use HasFactory, HasUuids, SoftDeletes;
    protected $guarded = [];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function instansi()
    {
        return $this->belongsTo(Instansi::class);
    }


    public function spesialis()
    {
        return $this->belongsTo(Spesialis::class);
    }

    public function wilayah()
    {
        return $this->belongsTo(Wilayah::class);
    }

    public function approvalHistory()
    {
        return $this->hasMany(ApprovalHistory::class);
    }

    public static function showData($id = null)
    {
        return $id ? PengajuanDokter::where('user_id', $id)->with('user', 'instansi', 'spesialis', 'wilayah.user', 'approvalHistory')->latest()->get() : PengajuanDokter::with('user', 'instansi', 'spesialis', 'wilayah.user', 'approvalHistory')->latest()->get();
    }

    public static function showByAm($am_id)
    {
        $wilayahIds = Wilayah::where('user_id', $am_id)->pluck('id');
        $userMrIds = WilayahDetail::whereIn('wilayah_id', $wilayahIds)->pluck('user_id')->toArray();
        $userIds = array_merge($userMrIds, [$am_id]);
        return self::whereIn('user_id', $userIds)
            ->with('user', 'instansi', 'spesialis', 'wilayah.user', 'wilayah.wilayahdetails', 'approvalHistory')
            ->latest()
            ->get();
    }
}
