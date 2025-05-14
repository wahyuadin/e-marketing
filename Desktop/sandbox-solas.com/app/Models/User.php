<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable, HasUuids, SoftDeletes;

    protected $guarded = [];

    public function wilayahDetail()
    {
        return $this->hasMany(WilayahDetail::class, 'user_id');
    }

    public function absensi()
    {
        return $this->hasMany(Absensi::class, 'user_id');
    }

    public function wilayah()
    {
        return $this->hasMany(Wilayah::class, 'user_id');
    }
    public static function showData($id = null)
    {
        return $id ? self::where('id', $id)->with('wilayah','wilayahDetail.wilayah')->latest()->first() : self::with('wilayahDetail.wilayah')->latest()->get();
    }
}
