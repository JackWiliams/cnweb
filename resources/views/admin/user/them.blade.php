@extends('admin.layout.index')
@section('contentt')
 <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Người Dùng
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
                        <form action="admin/user/them" method="POST">
                            <input type="hidden" name="_token" value="{{csrf_token()}}"/>
                            <div class="form-group">
                                <label>Tên người dùng</label>
                                <input class="form-control" type="text" id="your_last_name" name="fullname" placeholder="Nhập tên người dùng"/> 
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input class="form-control" type="email" id="email" name="email" required>
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input class="form-control" type="password" name="password" required>
                            </div>

                            <div class="form-group">
                                <label>Số điện thoại</label>
                                <input class="form-control" type="text" name="phone" required>
                            </div>

                            <div class="form-group">
                                <label>Địa chỉ</label>
                                <input class="form-control" type="text" id="address" name="address" required>
                            </div>
                             <div class="form-group">
                                <label>Chức vụ</label>
                                <select name="level">
                                    <option value="1">Quản trị</option>
                                    <option value="0">Người dùng</option>
                                </select>
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