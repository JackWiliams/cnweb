<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

//Route::get('/', function () {
  //  return view('welcome');
//});

Route::get('/index',[
	'as'=>'trang-chu',
	'uses'=>'PageController@getIndex'
]);

Route::get('loai-san-pham/{type}',[
	'as'=>'loaisanpham',
	'uses'=>'PageController@getLoaisanpham'
]);

Route::get('chi-tiet-san-pham/{id}',[
	'as'=>'chitietsanpham',
	'uses'=>'PageController@getChitietsanpham'
]);

Route::get('lien-he',[
	'as'=>'lienhe',
	'uses'=>'PageController@getLienhe'
]);

Route::get('gioi-thieu',[
	'as'=>'gioithieu',
	'uses'=>'PageController@getGioithieu'
]);

// Route::get('add-to-cart/{id}',[
// 	'as'=>'themgiohang',
// 	'uses'=>'PageController@getAddtoCart'
// ]);
Route::get('add-to-cart/{id}',[
	'as'=>'themgiohang',
	'uses'=>'PageController@getAddtoCart'
]);

Route::get('del-cart/{id}',[
	'as'=>'xoagiohang',
	'uses'=>'PageController@getDelitemcart'
]);

Route::get('dat-hang',[
	'as'=>'dathang',
	'uses'=>'PageController@getDathang'
]);

Route::post('dat-hang',[
	'as'=>'dathang',
	'uses'=>'PageController@postDathang'
]);

Route::get('dang-nhap',[
	'as'=>'dangnhap',
	'uses'=>'PageController@getDangnhap'
]);

Route::post('dang-nhap',[
	'as'=>'dangnhap',
	'uses'=>'PageController@postDangnhap'
]);

Route::get('dang-ki',[
	'as'=>'dangki',
	'uses'=>'PageController@getDangki'
]);

Route::post('dang-ki',[
	'as'=>'dangki',
	'uses'=>'PageController@postDangki'
]);

Route::get('dang-xuat',[
	'as'=>'dangxuat',
	'uses'=>'PageController@postDangxuat'
]);

Route::get('tim-kiem',[
	'as'=>'timkiem',
	'uses'=>'PageController@getTimkiem'
]);

Route::get('thay-doi-thong-tin',[
	'as'=>'thaydoithongtin',
	'uses'=>'UserController@getThayDoiThongTin'
]);

Route::get('dat-hang-thanh-cong',[
	'as'=>'dathangthanhcong',
	'uses'=>'UserController@getDathangThanhCong'
]);

Route::get('thay-doi-thanh-cong',[
	'as'=>'thaydoithanhcong',
	'uses'=>'UserController@getThayDoiThanhCong'
]);

Route::post('thay-doi-thong-tin',[
	'as'=>'thaydoithongtin',
	'uses'=>'UserController@postThayDoiThongTin'
]);

Route::get('quen-mat-khau',[
	'as'=>'quenmatkhau',
	'uses'=>'UserController@getQuenMatKhau'
]);

Route::post('quen-mat-khau',[
	'as'=>'quenmatkhau',
	'uses'=>'UserController@postQuenMatKhau'
]);

Route::get('admin/dangnhap','UserController@getDangNhapAdmin');

Route::post('admin/dangnhap','UserController@postDangNhapAdmin');

Route::get('admin/logout','UserController@getDangxuatAdmin');

Route::group(['prefix'=>'admin','middleware'=>'adminLogin'],function(){
	Route::group(['prefix'=>'sanpham'],function(){
		Route::get('danhsach','SanphamController@getDanhSach');

		Route::get('sua/{id}','SanphamController@getSua');

		Route::post('sua/{id}','SanphamController@postSua');

		Route::get('them','SanphamController@getThem');

		Route::post('them','SanphamController@postThem');

		Route::get('xoa/{id}','SanphamController@getXoa');
	});

	Route::group(['prefix'=>'theloaisanpham'],function(){
		Route::get('danhsach','TheloaisanphamController@getDanhSach');

		Route::get('sua/{id}','TheloaisanphamController@getSua');

		Route::post('sua/{id}','TheloaisanphamController@postSua');

		Route::get('them','TheloaisanphamController@getThem');

		Route::post('them','TheloaisanphamController@postThem');

		Route::get('xoa/{id}','TheloaisanphamController@getXoa');
	});

	Route::group(['prefix'=>'slide'],function(){
		Route::get('danhsach','SlideController@getDanhSach');

		Route::get('xoa/{id}','SlideController@getXoa');

		Route::get('them','SlideController@getThem');
	});

	Route::group(['prefix'=>'user'],function(){
		Route::get('danhsach','UserController@getDanhSach');

		Route::get('sua/{id}','UserController@getSua');

		Route::post('sua/{id}','UserController@postSua');

		Route::get('them','UserController@getThem');

		Route::post('them','UserController@postThem');

		Route::get('xoa/{id}','UserController@getXoa');
	});

	Route::group(['prefix'=>'bill'],function(){
		Route::get('danhsach','BillController@getDanhSach');

		Route::get('sua/{id}','BillController@getSua');

		Route::post('sua/{id}','BillController@postSua');

		Route::get('xoa/{id}','BillController@getXoa');
	});

	Route::group(['prefix'=>'billdetail'],function(){
		Route::get('chitietdonhang/{id}','BillDetailController@getChitiet');
	});

});
Auth::routes(['verify' => true]);

Route::get('/home', 'HomeController@index')->name('home');
Route::get('/', function () {
	return view('welcome');
    // Chỉ những người dùng xác nhận email rồi mới được vào
})->middleware('verified');