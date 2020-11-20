<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class FormRequestHistory extends Model
{
    public function scopeReceiver($query)
    {
        return $query->when(isNotAdmin(), function ($query) {
            return $query->where("created_by", userID());
        })->latest();
    }

    public function formRequest()
    {
        return $this->belongsTo('App\FormRequest');
    }
}
