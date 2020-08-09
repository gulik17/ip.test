<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Videos extends Model {
    protected $table = "videos";

    public $timestamps = false;

    protected $fillable = [
        'id',
        'youtube_id',
        'shortcode',
        'video_name'
    ];

    public function channel() {
        return $this->hasOne('App\Models\Youtubes','id', 'youtube_id');
    }

}
