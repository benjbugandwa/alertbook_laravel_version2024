<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Territoire extends Model
{
    public $timestamps = false;
    protected $primaryKey = 'pcode_territoire';
    public $incrementing = false;
}
