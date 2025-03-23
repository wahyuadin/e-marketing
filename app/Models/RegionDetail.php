<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class RegionDetail extends Model
{
    use HasFactory, HasUuids, SoftDeletes;
    protected $guarded = [];

    public function region()
    {
        return $this->belongsTo(Region::class);
    }

    public function wilayah()
    {
        return $this->belongsTo(Wilayah::class);
    }

    public static function showData($id = null)
    {
        return $id ? self::where('region_id', $id)->with('region', 'wilayah.wilayahdetails.user')->latest()->get() : self::with('region', 'wilayah.wilayahdetails.user')->latest()->get();
    }
}
