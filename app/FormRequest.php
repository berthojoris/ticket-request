<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class FormRequest extends Model
{
    public function scopeReceiver($query)
    {
        return $query->when(auth()->user()->id != 1, function ($query, $role) {
            return $query->whereStatus('OPEN')->where("received_id", auth()->user()->id)
                ->orWhere('requested_id', auth()->user()->id);
        });
    }

    public function scopeOnlyReceived($query)
    {
        return $query->when(auth()->user()->id != 1, function ($query, $role) {
            return $query->where("received_id", auth()->user()->id)->whereStatus('OPEN')->latest();
        });
    }

    public function detail()
    {
        return $this->hasMany('App\FormRequestHistory');
    }

    public function senderName()
    {
        return $this->belongsTo('App\User', 'requested_id', 'id');
    }

    public function receiveName()
    {
        return $this->belongsTo('App\User', 'received_id', 'id');
    }

    public static function boot()
    {
        parent::boot();
        static::deleting(function ($dataDetail) {
            $dataDetail->detail()->delete();
        });
    }
}
