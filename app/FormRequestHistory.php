<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class FormRequestHistory extends Model
{
    public function scopeReceiver($query)
    {
        return $query->when(auth()->user()->id != 1, function ($query, $role) {
            return $query->where("created_by", auth()->user()->id);
        });
    }
}
