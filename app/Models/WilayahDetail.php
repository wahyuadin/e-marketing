<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class WilayahDetail extends Model
{
    use HasFactory, HasUuids, SoftDeletes;
    protected $guarded = [];

    public function wilayah()
    {
        return $this->belongsTo(Wilayah::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public static function showData($id)
    {
        return $id ? WilayahDetail::where('wilayah_id', $id)->with('user', 'wilayah')->latest()->get() : WilayahDetail::with('user', 'wilayah')->latest()->get();
    }
}
