<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use App\User;
use Hash;

class UserController extends Controller
{
   public function getDanhsach()
   {
    	$user = User::all();
    	return view('admin.user.danhsach',compact('user'));
	}

	public function getThem(){

		return view('admin.user.them');
	}

	public function postThem(Request $req){
		$this->validate($req,
			[
				'fullname'=>'required',
				'email'=>'required',
				'phone'=>'required',
				'password'=>'required|min:6|max:20',
				'address'=>'required'
			],
			[
				'fullname.required'=>'Bạn cần nhập tên người dùng',
				'email.required'=>'Bạn cần nhập địa chỉ Email của người dùng',
				'phone.required'=>'Bạn cần nhập số điện thoại người dùng',
				'password.required'=>'Vui lòng nhập mật khẩu',
				'password.min'=>'Mật khẩu ít nhất 6 kí tự',
            	'password.max'=>'Mật khẩu tối đa 20 kí tự'
			]);

		$user = new User;
		$user->full_name = $req->fullname;
		$user->email = $req->email;
		$user->password = Hash::make($req->password);
		$user->phone = $req->phone;
		$user->address = $req->address;
		$user->save();



		return redirect('admin/user/them')->with('thongbao','Thêm thành công');
	}

	public function getSua($id)
	{
		$us = User::find($id);
		return view('admin.user.sua',compact('us'));
	}

	public function postSua(Request $req,$id)
	{
		$this->validate($req,
			[
				'fullname'=>'required',
				'email'=>'required',
				'phone'=>'required',
				
			],
			[
				'fullname.required'=>'Bạn cần nhập tên người dùng',
				'email.required'=>'Bạn cần nhập địa chỉ Email của người dùng',
				'phone.required'=>'Bạn cần nhập số điện thoại người dùng'
				
			]);

		$user = User::find($id);
		$user->full_name = $req->fullname;
		$user->email = $req->email;
		$user->phone = $req->phone;
		$user->address = $req->address;
		$user->level = $req->level;

		$user->save();
		return redirect('admin/user/sua/'.$id)->with('thongbao','Sửa thành công');
	}

	public function getXoa($id){

		$user = User::find($id);
		$user->delete();
		return redirect('admin/user/danhsach')->with('thongbao','Xóa thành công');
	}

	public function getDangNhapAdmin(){

		return view('admin.login');
	}

	public function postDangNhapAdmin(Request $req){
		$this->validate($req,
			[
				'email'=>'required',
				'password'=>'required|min:3|max:32'
			],
			[
				'email.required'=>'Bạn chưa nhập Email',
				'password.required'=>'Bạn chưa nhập mật khẩu',
				'password.min'=>'Mật khẩu chứa ít nhất 3 kí tự',
				'password.max'=>'Mật khẩu chứa tối đa 32 kí tự'
			]);
		if(Auth::attempt(['email'=>$req->email,'password'=>$req->password]))
		{
			return redirect('admin/sanpham/danhsach');
		}
		else
		{
			return redirect('admin/dangnhap')->with('thongbao',"Đăng nhập thất bại");
		}
	}

	public function getDangxuatAdmin(){
		Auth::logout();

		return redirect('admin/dangnhap');
	}

	public function getThayDoiThongTin(){

		$id = Auth::user()->id;
		$user = User::find($id);		
		return view('page.thaydoithongtin',compact('user'));
	}

	public function postThayDoiThongTin(Request $req){
		$this->validate($req,
		[
            'fullname'=>'required',
            'phone'=>'required'
		],
		[
			'fullname.required'=>'Bạn chưa điền tên người dùng',
            'phone.required'=>'Bạn chưa nhập số điện thoại'
		]);
		
		$id = Auth::user()->id;
		$user = User::find($id);
		$user->full_name = $req->fullname;
        $user->email = $req->email;
        $user->phone = $req->phone;
        $user->address = $req->address;
        $user->save();
        return redirect()->back()->with('thongbao',"Thay Thông Tin Thành Công");
	}

	public function getThayDoiThanhCong()
	{
		return view('page.thaydoithanhcong');
	}


	public function getDathangThanhCong()
	{
		return view('page.dathangthanhcong');
	}

	public function getQuenMatKhau(){

		return view('page.quenmatkhau');
	}

	public function postQuenMatKhau(Request $req){
		$this->validate($req,
			[
				'email'=>'required|email',
				'password2'=>'required',
				'password'=>'required|min:6|max:20',
				're_password'=>'required|same:password'
			],
			[
				'email.required'=>'Bạn chưa nhập Email',
				'email.email'=>'Không đúng định dạng Email',
				'password2.required'=>'Bạn chưa nhập mật khẩu cấp 2',
				'password.required'=>'Bạn chưa nhập mật khẩu',
				'password.min'=>'Mật khẩu ít nhất 6 kí tự',
            	'password.max'=>'Mật khẩu tối đa 20 kí tự',
				're_password.required'=>'Bạn chưa xác nhận mật khẩu',
				're_password.same'=>'Xác nhận mật khẩu không đúng'
			]);
		//$credentials = array('email'=>$req->email,'remember_token'=>$req->password2);
		if(Auth::attempt(['email'=>$req->email,'password2'=>$req->remember_token])){
            return redirect()->back()->with(['flag'=>'success','message'=>'Lấy lại mật khẩu thành công']);
        }
        else{
            return redirect()->back()->with(['flag'=>'danger','message'=>'Lấy lại mật khẩu thất bại']);
        }
	}

}
