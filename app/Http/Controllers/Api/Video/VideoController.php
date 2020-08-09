<?php

namespace App\Http\Controllers\Api\Video;

use App\Http\Controllers\Api\Controller;
use App\Models\Videos;

class VideoController extends Controller {
    public function video() {
        $videos = Videos::get();
        foreach ($videos as &$video) {
            $video->channel;
        }
        return response()->json($videos, 200);
    }

    public function videoById($id) {
        $video = Videos::find($id);
        if ( is_null($video) ) {
            return response()->json(['error' => true, 'message' => 'Not found'], 404);
        }
        $video->channel;
        return response()->json($video, 200);
    }
}
