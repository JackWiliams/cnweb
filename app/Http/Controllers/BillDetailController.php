<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\BillDetail;
use App\Bill;
use App\Customer;

class BillDetailController extends Controller
{
    public function getChitiet($id){
    	$bill = Bill::find($id);



    	$cus = Customer::where('id',$bill->id_customer)->first();
    	

    	$billdetail = BillDetail::where('id_bill',$id)->get();
    	return view('admin.billdetail.chitietdonhang',compact('billdetail','cus'));
    }
}
