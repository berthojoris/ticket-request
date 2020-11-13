<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class FormRequest extends Model
{
    public function scopeReceiver($query)
    {
        return $query->when(auth()->user()->id != 1, function ($query, $role) {
            return $query->where("status", 'open')->where("received_id", auth()->user()->id)
            ->orWhere('requested_id', auth()->user()->id);
        });
    }

    public function scopeOnlyReceived($query)
    {
        return $query->when(auth()->user()->id != 1, function ($query, $role) {
            return $query->where("received_id", auth()->user()->id)->whereStatus('open');
        });
    }
}
