<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\ProductType;
use App\Product;

class TheloaisanphamController extends Controller
{
    public function getDanhSach(){
    	$theloai = ProductType::all();
    	return view('admin.theloai_sanpham.danhsach',compact('theloai'));
    } 

    public function getThem(){

    	return view('admin.theloai_sanpham.them');
    }

    public function postThem(Request $req){
        $this->validate($req,
        [
            'tenloaisanpham'=>'required',
            'mota'=>'required'
        ],
        [
            'tenloaisanpham.required'=>'Bạn cần nhập tên loại sản phẩm',
            'mota.required'=>'Bạn cần mô tả loại sản phẩm'
        ]);

        $ls = new ProductType;
        $ls->name = $req->tenloaisanpham;
        $ls->description = $req->mota;
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
            $ls->image = $tenHinh;
        }

        else
        {
            $ls->image = "";
        }

        $ls->save();
    	return view('admin.theloai_sanpham.them')->with('thongbao','Thêm thành công loại sản phẩm');
    }

    public function getSua($id){
        $loaisanpham = ProductType::find($id);
        return view('admin.theloai_sanpham.sua',compact('loaisanpham')); 
    }

    public function postSua(Request $req,$id){
             $this->validate($req,
        [
            'tenloaisanpham'=>'required',
            'mota'=>'required'
        ],
        [
            'tenloaisanpham.required'=>'Bạn cần nhập tên loại sản phẩm',
            'mota.required'=>'Bạn cần mô tả loại sản phẩm'
        ]);

        $ls = ProductType::find($id);
        $ls->name = $req->tenloaisanpham;
        $ls->description = $req->mota;
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
            $ls->image = $tenHinh;
        }

        else
        {
            $ls->image = "";
        }

        $ls->save();
        return redirect('admin/theloaisanpham/sua/'.$id)->with('thongbao','Sửa thành công');
    }

    public function getXoa($id){
        $loaisanpham = ProductType::find($id);
        $sanpham = Product::where('id_type',$id)->get();
        foreach($sanpham as $sp){
            $sp->delete();
        }
        $loaisanpham->delete();
        return redirect('admin/theloaisanpham/danhsach')->with('thongbao','Xóa thành công');
    }
}
