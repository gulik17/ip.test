<?php


namespace App\Http\Controllers\Api\Channel;
use App\Http\Controllers\Api\Controller;
use App\Models\Youtubes;
use App\Models\Videos;

class ChannelController extends Controller {
    public function channel() {
        return response()->json(Youtubes::get(), 200);
    }

    public function channelById($id) {
        $channel = Youtubes::find($id);
        if ( is_null($channel) ) {
            return response()->json(['error' => true, 'message' => 'Not found'], 404);
        }
        $limit = (isset($_REQUEST['limit'])) ? (int) $_REQUEST['limit'] : 9;
        $channel->videos = Videos::where('youtube_id', $channel->id)->limit($limit)->get();
        return response()->json($channel, 200);
    }
}
