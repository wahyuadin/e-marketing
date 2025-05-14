<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ApprovalHistory extends Model
{
    use HasFactory, HasUuids, SoftDeletes;
    protected $guarded = [];

    public function pengajuan_dokter()
    {
        return $this->belongsTo(PengajuanDokter::class);
    }

    public static function showData()
    {
        return Self::with('pengajuan_dokter.user')->where('deleted_at', null)->latest()->with('pengajuan_dokter.user')->get();
    }
}
