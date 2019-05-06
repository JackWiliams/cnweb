<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Slide;


class SlideController extends Controller
{
    public function getDanhSach(){
    	$slide = Slide::all();

    	return view('admin.slide.danhsach',compact('slide'));
    } 

    public function getXoa($id){

    	$slide = Slide::find($id);

    	$slide->delete();

    	return view('admin.slide.sua');
    }

    public function getThem(){

    	return view('admin.slide.them');
    }

    public function postThem(Request $req){
    	$this->validate($req,
    		[

    		],
    		[

    		]);
    	$spp = new Slide;
    	if($req->hasFile('hinh'))
    	{
    		$file = $req->file('hinh');
    		$duoi = $file->getClientOriginalExtension();
    		$name = $file->getClientOriginalName();
    		$tenHinh = str_random(7)."_".$name;
    		while(file_exists("source/image/slide/".$tenHinh))
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

    	return redirect('admin.slide.them')->with('thongbao','Thêm thành công');

    }
}
