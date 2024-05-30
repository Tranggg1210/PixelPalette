<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Mail\ForgotMail;
use App\Models\Account;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
/**
 * @OA\Post(
 *  path="/api/forgot",
 *  summary="Quên mật khẩu ",
 *  description="Quên mật khẩu ",
 *  method="POST",
 *  tags={"User"},
 *    @OA\RequestBody(
 *         @OA\JsonContent(
 *             allOf = {
 *                  @OA\Schema(
 *                      @OA\Property(property="Email",type="string"),
 *                      example={"email": "trungquanbg3@gmail.com"}
 *                  )
 *              }
 *         )
 *     ),
*          @OA\Response(
*          response = 200,
*          description = "Success",

*       ),
*   ),
* )
 **/

class ForgotController extends Controller
{
    public function forgot(Request $request)
    {
        // $validate = Validator::make([
        //     'email' => 'required|email',
        // ]);
        $user = User::where('Email', $request->email)->first();
            if ($user) {
                $password = Str::random(8);
                $user->Token = Str::random(32);
                $user->PasswordHash = Hash::make($password);
                $user->save();
                dd(Mail::to($user->Email)->send(new ForgotMail($user, $password)));
               try {
                    Mail::to($user->Email)->send(new ForgotMail($user, $password));
                    return response()->json([
                        'status' => true,
                        'message' => 'Reset password thành công !',
                    ], 200);
               }catch(\Exception $exception){
                    return response()->json([
                        'status' => false,
                        'error' => 'Không thể kết nối được đến gmail !',
                        'message' => "Chưa gửi mật khẩu mới tới email !",
                    ], 200);
               }
            } else {
                return response()->json([
                    'message' => 'Email chưa được đăng ký',
                ], 200);
            }
    }
}
