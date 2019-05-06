@extends('admin.layout.index')
@section('contentt')
 <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Thể Loại Sản Phẩm
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
                        <form action="admin/theloaisanpham/sua/{{$loaisanpham->id}}" method="POST" enctype="multipart/form-data">
                            <input type="hidden" name="_token" value="{{csrf_token()}}"/>
                            <div class="form-group">
                                <label>Tên loại sản phẩm</label>
                                <input class="form-control" name="tenloaisanpham" value="{{$loaisanpham->name}}" />
                            </div>
                            <div class="form-group">
                                <label>Mô tả</label>
                                <textarea id='demo' class="form-control ckeditor rows="3" name="mota">{{$loaisanpham->description}}</textarea>
                            </div>
                            <div class="form-group">
                                <p>
                                <img src="source/image/product/{{$loaisanpham->image}}" alt="" height="300px">
                                </p>
                                <label>Hình ảnh minh họa loại sản phẩm</label>
                                <input type="file" name="hinh"/>
                            </div>
                            <button type="submit" class="btn btn-default">Sửa </button>
                        <form>
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
@endsection