<?php


namespace App\Http\Controllers\Api\Channel;
use App\Http\Controllers\Api\Controller;
use App\Models\Youtubes;
use App\Models\Videos;

class ChannelController extends Controller {
    public function index() {
        /*$channel = Youtubes::with(['videos' => function ($query) {
            $query->limit(8);
        }])->get();*/

        $channel = Youtubes::get();
        if ( is_null($channel) ) {
            return response()->json(['error' => true, 'message' => 'Not found'], 404);
        }
        $limit = (isset($_REQUEST['limit'])) ? (int) $_REQUEST['limit'] : 8;
        foreach ($channel as &$item) {
            $item->videos = Videos::where('youtube_id', $item->id)->limit($limit)->get();;
        }
        return response()->json($channel, 200);
    }

    public function channelById($id) {
        $channel = Youtubes::find($id);
        if ( is_null($channel) ) {
            return response()->json(['error' => true, 'message' => 'Not found'], 404);
        }
        $channel->videos = Videos::where('youtube_id', $channel->id)->get();
        return response()->json($channel, 200);
    }
}
