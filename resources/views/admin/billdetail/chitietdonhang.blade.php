@extends('admin.layout.index')
@section('contentt')
 <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Đơn hàng
                            <small>Chi tiết đơn hàng</small>
                        </h1>
                    </div>
                    <!-- /.col-lg-12 -->
                     @if(Session::has('thongbao'))
                        <div class="alert alert-success">
                            {{session('thongbao')}}   
                        </div>
                        @endif
                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                            <tr align="center">
                                <th>ID Đơn Hàng</th>
                                <th>Tên khách hàng</th>
                                <th>Giới tính</th>
                                <th>Email</th>
                                <th>Địa chỉ</th>
                                <th>Số điện thoại</th>
                                <th>ID Sản phẩm</th>
                                <th>Số lượng</th>
                                <th>Số tiền/sản phẩm</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($billdetail as $bi)
                            <tr class="odd gradeX" align="center">
                                <td>{{$bi->id_bill}}</td>
                                <td>{{$cus->name}}</td>
                                <td>{{$cus->gender}}</td>
                                <td>{{$cus->email}}</td>
                                <td>{{$cus->address}}</td>
                                <td>{{$cus->phone_number}}</td>
                                <td>{{$bi->id_product}}</td>
                                <td>{{$bi->quantity}}</td>
                                <td>{{number_format($bi->unit_price)}}</td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
@endsection