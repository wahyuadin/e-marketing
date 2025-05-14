<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth;

class Wilayah extends Model
{
    use HasFactory, HasUuids, SoftDeletes;
    protected $guarded = [];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function wilayahdetails()
    {
        return $this->hasMany(WilayahDetail::class);
    }

    public function dokter()
    {
        return $this->hasMany(Dokter::class);
    }

    public function regionalDetail()
    {
        return $this->hasMany(RegionDetail::class, 'wilayah_id');
    }


    public static function showData($id = null)
    {
        return $id ? self::find($id)->with('user', 'wilayahdetails.wilayah', 'wilayahdetails.user', 'dokter', 'regionalDetail')->latest() : self::with('user', 'wilayahdetails.wilayah', 'wilayahdetails.user', 'dokter', 'regionalDetail')->latest()->get();
    }
}
