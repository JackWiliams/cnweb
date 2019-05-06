<?php

namespace App\Http\Middleware;
use Auth;
use Closure;

class AdminLoginMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if(Auth::check()){
            $user = Auth::user();
            if($user->level == 1){
                return $next($request);
            }
            else{
                return redirect('admin/dangnhap')->with('thongbao','Bạn không có quyền quản trị');
            }
        }
       else
        {
            return redirect('admin/dangnhap')->with('thongbao','Bạn cần đăng nhập dưới quyền quản trị');
        }
    }
}
