@extends('admin.layout.index')
@section('contentt')
 <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Sản Phẩm
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
                        <form action="admin/sanpham/sua/{{$sanpham->id}}" method="POST" enctype="multipart/form-data">
                            <input type="hidden" name="_token" value="{{csrf_token()}}"/>
                            <div class="form-group">
                                <label>Tên Sản Phẩm</label>
                                <input class="form-control" name="tensanpham" value="{{$sanpham->name}}"/>
                            </div>
                            <div class="form-group">
                                <label>Loại sản phẩm</label><br>
                                <select name="loaisanpham"
                                >Loại sản phẩm
                                @foreach($loaisanpham as $lsp)
                                <option 
                                value="{{$lsp->id}}">{{$lsp->name}}</option>
                                @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Mô tả</label>
                                <textarea id='demo' class="form-control ckeditor rows="3" name="mota">{{$sanpham->description}}</textarea>
                            </div>
                            <div class="form-group">
                                <label>Giá sản phẩm</label>
                                <input class="form-control" name="giasanpham" type="text" value="{{$sanpham->unit_price}}" />
                            </div>
                             <div class="form-group">
                                <label>Giá khuyến mại</label>
                                <input class="form-control" name="giakhuyenmai" type="text" 
                                value="{{$sanpham->promotion_price}}" />
                            </div>
                            <div class="form-group">
                                <label>Hình ảnh</label>
                                <p>
                                <img src="source/image/product/{{$sanpham->image}}" alt="" height="300px">
                                </p>
                                <input type="file" name="hinh" class="form-control" />
                            </div>
                            <div class="form-group">
                                <label>Đơn vị (hộp/cái)</label><br>
                                <select name="unit">
                                    <option value="hop">Hộp</option>
                                    <option value="cai">Cái</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Mới/cũ (1/0)</label><br>
                                <select name="new">
                                    <option value="1">Mới</option>
                                    <option value="0">Cũ</option>
                                </select>
                            </div>
                            
                            <button type="submit" class="btn btn-default">Sửa sản phẩm</button> 
                        <form>
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
@endsection