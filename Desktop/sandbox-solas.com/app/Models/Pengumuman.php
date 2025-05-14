<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Pengumuman extends Model
{
    use HasFactory, HasUuids, SoftDeletes;
    protected $guarded = [];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public static function showData($id = null)
    {
        return $id ? self::where('id', $id)->with('user')->latest()->get() : self::with('user')->latest()->get();
    }

    public static function editData($id, $data)
    {
        return self::where('id', $id)->update($data);
    }

    public static function deleteData($id)
    {
        return self::where('id', $id)->delete();
    }
}
