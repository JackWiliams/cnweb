 @extends('admin.layout.index')
 @section('contentt')
 <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Đơn hàng
                            <small>Danh sách</small>
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
                                <th>ID</th>
                                <th>Ngày Đặt Hàng</th>
                                <th>Tổng tiền</th>
                                <th>Phương thức thanh toán</th>
                                <th>Ghi chú</th>
                                <th>Trạng thái</th>
                                <th>Ngày cập nhật</th>
                                <th>Sửa</th>
                                <th>Delete</th>
                                <th>Chi Tiết</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($bill as $bi)
                            <tr class="odd gradeX" align="center">
                                <td>{{$bi->id}}</td>
                                <td>{{$bi->date_order}}</td>
                                <td>{{number_format($bi->total)}}</td>
                                <td>{{$bi->payment}}</td>
                                <td>{{$bi->note}}</td>
                                <td>{{$bi->status}}</td>
                                <td>{{$bi->updated_at}}</td>
                                <td class="center"><i class="fa fa-pencil fa-fw"></i><a href="admin/bill/sua/{{$bi->id}}">Edit</a></td>
                                <td class="center"><i class="fa fa-trash-o  fa-fw"></i><a href="admin/bill/xoa/{{$bi->id}}"> Delete</a></td>
                                <td class="center"><i class="fa fa-check"></i> <a href="admin/billdetail/chitietdonhang/{{$bi->id}}">Chi tiết</a></td>
                                @endforeach
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
@endsection