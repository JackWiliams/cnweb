 @extends('admin.layout.index')
 @section('contentt')
 <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Sản Phẩm
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
                                <th>Name</th>
                                <th>ID Loại sản phẩm</th>
                                <th>Mô tả</th>
                                <th>Giá</th>
                                <th>Giá khuyến mại</th>
                                <th>Hình ảnh</th>
                                <th>Đơn vị</th>
                                <th>Cũ/Mới</th>
                                <th>Delete</th>
                                <th>Edit</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($sanpham as $sp)
                            <tr class="odd gradeX" align="center">
                                <td>{{$sp->id}}</td>
                                <td>{{$sp->name}}</td>
                                <td>{{$sp->id_type}}</td>
                                <td>{{$sp->description}}</td>
                                <td>{{number_format($sp->unit_price)}}</td>
                                <td>{{number_format($sp->promotion_price)}}</td>
                                <td><img src="source/image/product/{{$sp->image}}" alt="" height="100px"></td>
                                <td>{{$sp->unit}}</td>
                                <td>{{$sp->new}}</td>
                                <td class="center"><i class="fa fa-trash-o  fa-fw"></i><a href="admin/sanpham/xoa/{{$sp->id}}"> Delete</a></td>
                                <td class="center"><i class="fa fa-pencil fa-fw"></i> <a href="admin/sanpham/sua/{{$sp->id}}">Edit</a></td>
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