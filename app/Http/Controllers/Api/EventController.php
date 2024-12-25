<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Event;
use Illuminate\Http\Request;

class EventController extends Controller
{
    public function getEvent()
    {
        $event_promotion = Event::select('image_url')->get();

        return response()->json([
            'success' => true,
            'data' => $event_promotion,
        ]);
    }
}
