<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Instansi extends Model
{
    use HasFactory, HasUuids, SoftDeletes;
    protected $guarded = [];

    public static function showData($id = null)
    {
        return $id ? self::where('id', $id)->latest() : self::latest()->get();
    }
}
