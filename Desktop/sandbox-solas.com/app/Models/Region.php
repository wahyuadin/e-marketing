<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Region extends Model
{
    use HasFactory, HasUuids, SoftDeletes;

    protected $guarded = [];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function regiondetails()
    {
        return $this->hasMany(RegionDetail::class);
    }

    public static function showData($id = null)
    {
        return $id ? self::find($id)->with('user', 'regiondetails.wilayah')->latest() : self::with('user', 'regiondetails.wilayah')->latest()->get();
    }
}
