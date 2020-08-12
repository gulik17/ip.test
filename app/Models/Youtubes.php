<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Youtubes extends Model {
    protected $table = "youtubes";

    public $timestamps = false;

    protected $fillable = [
        'id',
        'channel_id',
        'channel_name'
    ];

    public function videos() {
        return $this->hasMany('App\Models\Videos', 'youtube_id', 'id');
    }

}
