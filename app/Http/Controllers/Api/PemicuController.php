<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Pemicu;
use Illuminate\Support\Facades\Cache;

class PemicuController extends Controller
{
    public function index()
    {
        $pemicus = Cache::remember('pemicu_all', 3600, function () {
            return Pemicu::all();
        });

        return response()->json($pemicus);
    }
}