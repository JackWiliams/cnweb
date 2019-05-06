<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Bill;
use App\BillDetail;
use App\Customer;

class BillController extends Controller
{
    public function getDanhsach(){
    	
    	$bill = Bill::all();

    	return view('admin.bill.danhsach',compact('bill'));
    }

    public function getSua($id){

    	$bill = Bill::find($id);

    	return view('admin.bill.sua',compact('bill'));
    }

    public function postSua(Request $req,$id){
    	$this->validate($req,
    		[
    			'ngaydathang'=>'required|date',
    			'tongtien'=>'required',
    			'phuongthuc'=>'required',
    			'ghichu'=>'required',
    			'status'=>'required'
    		],
    		[
    			'ngaydathang.required'=>'Chưa chọn ngày đặt hàng',
    			'tongtien.required'=>'Tổng tiền trống',
    			'phuongthuc.required'=>'Chưa chọn phương thức thanh toán',
    			'ghichu.required'=>'Chưa chú thích',
    			'status.required'=>'Chưa chọn trạng thái đơn hàng'
    		]);

    		$bill = Bill::find($id);

    		$bill->date_order = $req->ngaydathang;
    		$bill->total = $req->tongtien;
    		$bill->payment = $req->phuongthuc;
    		$bill->note = $req->ghichu;
    		$bill->status = $req->status;

    		$bill->save();
    		return redirect('admin/bill/sua'.$id)->with('thongbao','Sửa thành công'); 
    } 

    public function getXoa($id)
    {
    	$bill = Bill::find($id);
        $customer  = Customer::where('id',$bill->id_customer)->first();
        $customer->delete();
        $billdetail = BillDetail::where('id_bill',$id)->get();

        foreach($billdetail as $bd){
            $bd->delete();
        }

    	$bill->delete();
    	return redirect('admin/bill/danhsach')->with('thongbao','Xóa thành công');
    }
}
