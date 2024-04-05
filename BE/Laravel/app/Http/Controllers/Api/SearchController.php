<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Post;
use App\Models\User;
use Illuminate\Http\Request;

class SearchController extends Controller
{
    public function search(Request $request){
        $keyword = $request -> keyword;
        if(isset($keyword)){
            $users = User::where('FirstName','LIKE', '%'. $keyword . '%') -> orWhere('LastName','LIKE', '%'. $keyword . '%') -> get();
            $posts = Post::where('Caption', 'LIKE', '%'.$keyword.'%')->get();
            return response()->json([
                'status' => 'success',
                'data' => [
                    'users' => null ?? $users,
                    'posts' => null ?? $posts,
                ]
            ],200);
        }else{
            return response()->json([
                'keyword' => $keyword,
                'message' => 'Không có thông tin về nội dung này!',
            ],200);
        }
    }
}
