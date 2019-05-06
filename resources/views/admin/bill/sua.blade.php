@extends('admin.layout.index')
@section('contentt')
 <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Đơn hàng
                            <small>Sửa</small>
                        </h1>
                    </div>
                    <!-- /.col-lg-12 -->
                    <div class="col-lg-7" style="padding-bottom:120px">
                        @if(count($errors) > 0)
                        <div class="alert alert-danger"> 
                        @foreach($errors->all() as $err)
                            {{$err}}<br>
                        @endforeach
                        </div>
                        @endif

                        @if(Session::has('thongbao'))
                        <div class="alert alert-success">
                            {{session('thongbao')}}   
                        </div>
                        @endif
                        <form action="admin/bill/sua/{{$bill->id}}" method="POST">
                            <input type="hidden" name="_token" value="{{csrf_token()}}"/>
                            <div class="form-group">
                                <label>Ngày đặt hàng</label>
                                <input class="form-control" type="date" name="ngaydathang" value="{{$bill->date_order}}" />
                            </div>
                            <div class="form-group">
                                <label>Tổng tiền</label><br>
                                <input class="form-control" name="tongtien" value="{{$bill->total}}" />
                            </div>
                            <div class="form-group">
                                <label>Phương thức thanh toán</label>
                                <select name="phuongthuc">
                                    <option value="COD">Thanh toán khi nhận hàng</option>
                                    <option value="ATM">Chuyển khoản</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Ghi Chú</label>
                                <input class="form-control" name="ghichu" type="text" value="{{$bill->note}}" />
 							</div>
 							<div class="form-group">
                                <label>Status</label>
                                <select name="status">
                                    <option value="1">Đã giao hàng</option>
                                    <option value="0">Chưa giao hàng</option>
                                </select>
 							</div>
                            
                            <button type="submit" class="btn btn-default">Sửa</button>
                        <form>
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
@endsection