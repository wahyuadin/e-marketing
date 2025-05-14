<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Dokter extends Model
{
    use HasFactory, HasUuids, SoftDeletes;

    protected $guarded = [];

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

    public static function showData($id = null)
    {
        return $id ? self::where('id', $id)->with('instansi', 'spesialis', 'wilayah')->latest() : self::with('instansi', 'spesialis', 'wilayah')->latest()->get();
    }
}
