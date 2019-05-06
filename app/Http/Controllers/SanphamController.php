<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use App\ProductType;

class SanphamController extends Controller
{
    public function getDanhSach(){
    	$sanpham = Product::all();
    	return view('admin.sanpham.danhsach',compact('sanpham'));
    } 

    public function getSua($id){
        $sanpham = Product::find($id); 
        $loaisanpham = ProductType::all();

    	return view('admin.sanpham.sua',compact('sanpham','loaisanpham'));
    }

    public function postSua(Request $req,$id){
        $this->validate($req,
        [
            'tensanpham'=>'required',
            'loaisanpham'=>'required',
            'mota'=>'required',
            'giasanpham'=>'required',
            'giakhuyenmai'=>'required',
            'unit'=>'required',
            'new'=>'required'
        ],
        [
            'tensanpham.required'=>'Bạn cần điền tên sản phẩm',
            'loaisanpham.required'=>'Bạn cần chọn loại sản phẩm',
            'mota.required'=>'Bạn cần mô tả sản phẩm',
            'giasanpham.required'=>'Bạn cần điền giá của sản phẩm',
            'giakhuyenmai.required'=>'Bạn cần điền giá khuyến mại của sản phẩm',
            'new.required'=>'Bạn cần chọn trạng thái sản phẩm'
        ]);
        $spp = Product::find($id);
        $spp->name = $req->tensanpham;
        $spp->id_type = $req->loaisanpham;
        $spp->description = $req->mota;
        $spp->unit_price = $req->giasanpham;
        $spp->promotion_price = $req->giakhuyenmai;
        $spp->unit = $req->unit;
        $spp->new = $req->new;
        if($req->hasFile('hinh'))
        {
            $file = $req->file('hinh');
            $duoi = $file->getClientOriginalExtension();
            $name = $file->getClientOriginalName();
            $tenHinh = str_random(7)."_".$name;
            while(file_exists("source/image/product/".$tenHinh))
            {
                $tenHinh = str_random(4)."_".$name;
            }
            $file->move("source/image/product",$tenHinh);
            $spp->image = $tenHinh;

        }

        else
        {
            $spp->image = "";
        }

        $spp->save();

        return redirect('admin/sanpham/sua/'.$id)->with('thongbao','Sửa thành công!!');
    }

    public function getThem(){
    	$loaisp = ProductType::all();

    	return view('admin.sanpham.them',compact('loaisp'));
    }

    public function postThem(Request $req){
    	$this->validate($req,
    	[
    		'tensanpham'=>'required',
    		'loaisanpham'=>'required',
    		'mota'=>'required',
    		'giasanpham'=>'required',
    		'giakhuyenmai'=>'required',
    		'unit'=>'required',
    		'new'=>'required'
    	],
    	[
    		'tensanpham.required'=>'Bạn cần điền tên sản phẩm',
    		'loaisanpham.required'=>'Bạn cần chọn loại sản phẩm',
    		'mota.required'=>'Bạn cần mô tả sản phẩm',
    		'giasanpham.required'=>'Bạn cần điền giá của sản phẩm',
    		'giakhuyenmai.required'=>'Bạn cần điền giá khuyến mại của sản phẩm',
    		'new.required'=>'Bạn cần chọn trạng thái sản phẩm'
    	]);

    	$spp = new Product;
    	$spp->name = $req->tensanpham;
    	$spp->id_type = $req->loaisanpham;
    	$spp->description = $req->mota;
    	$spp->unit_price = $req->giasanpham;
    	$spp->promotion_price = $req->giakhuyenmai;
    	$spp->unit = $req->unit;
    	$spp->new = $req->new;
    	if($req->hasFile('hinh'))
    	{
    		$file = $req->file('hinh');
    		$duoi = $file->getClientOriginalExtension();
    		if($duoi != 'jpg' && $duoi != 'png' && $duoi != 'pneg')
    		{
    			return redirect('admin/sanpham/them')->with('thongbao','Không đúng định dạng file ảnh');
    		}
    		$name = $file->getClientOriginalName();
    		$tenHinh = str_random(4)."_".$name;
    		while(file_exists("source/image/product/".$tenHinh))
    		{
    			$tenHinh = str_random(4)."_".$name;
    		}
    		$file->move("source/image/product",$tenHinh);
    		$spp->image = $tenHinh;
    	}

    	else
    	{
    		$spp->image = "";
    	}

    	$spp->save();


    	return redirect('admin/sanpham/them')->with('thongbao','Thêm thành công!!');
    }

    public function getXoa($id){
        $sanpham = Product::find($id);
        $sanpham->delete();
        return redirect('admin/sanpham/danhsach')->with('thongbao','Xóa thành công!!');
    }
}
