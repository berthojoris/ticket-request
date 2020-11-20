<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BrandUser extends Model
{
    public function scopeExcludeAdmin($query)
    {
        return $query->where("role_id", "!=", adminRoleID());
    }
}
