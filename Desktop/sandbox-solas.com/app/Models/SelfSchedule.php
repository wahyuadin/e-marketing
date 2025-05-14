<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class SelfSchedule extends Model
{
    use HasFactory, HasUuids, SoftDeletes;
    protected $guarded = [];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function DailyVisit()
    {
        return $this->belongsTo(DailyVisit::class);
    }

    public static function showData($id = null)
    {
        return $id ? SelfSchedule::where('user_id', $id)->with('user', 'DailyVisit')->latest()->get() : SelfSchedule::with('user', 'DailyVisit')->latest()->get();
    }
}
