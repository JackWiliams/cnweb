@extends('admin.layout.index')
@section('contentt')
 <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Thể Loại Sản Phẩm
                            <small>Thêm</small>
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
                        <form action="admin/theloaisanpham/them" method="POST" enctype="multipart/form-data">
                            <input type="hidden" name="_token" value="{{csrf_token()}}"/>
                            <div class="form-group">
                                <label>Tên Thể Loại sản Phẩm</label>
                                <input class="form-control" name="linksanpham" placeholder="Nhập tên thể loại sản phẩm" />
                            </div>
                             <div class="form-group">
                                <label>Mô tả</label>
                                <textarea id='demo' class="form-control ckeditor rows="3" name="mota"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Hình ảnh</label>
                                <input type="file" name="hinh"/>
                            </div>
                            <button type="submit" class="btn btn-default">Thêm</button>
                        <form>
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
@endsection