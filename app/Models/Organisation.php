<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Organisation extends Model
{
    public $timestamps = false;
    protected $primaryKey = 'code_organisation';
    public $incrementing = false;
}
