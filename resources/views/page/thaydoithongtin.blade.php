@extends('master')
@section('content')
<div class="inner-header">
		<div class="container">
			<div class="pull-left">
				
			</div>
			<div class="pull-right">
				<div class="beta-breadcrumb">
					<a href="{{route('trang-chu')}}">Home</a> / <span>Thay Đổi Thông Tin</span>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	
	<div class="container">
		<div id="content">
			@if(count($errors)>0)
						<div class="alert alert-danger">
							@foreach($errors->all() as $err)
							{{$err}}
							@endforeach
						</div>
					@endif
					@if(Session::has('thongbao'))
					<center><div class="alert alert-success">{{Session::get('thongbao')}}</div></center>
					@endif
			
			<form action="{{route('thaydoithongtin')}}" method="post" class="beta-form-checkout">
				<input type="hidden" name="_token" value="{{csrf_token()}}">
				<div class="row">
					<div class="col-sm-3"></div>
					
					<div class="col-sm-6">
						<h4>Thay Đổi Thông Tin</h4>
						<div class="space20">&nbsp;</div>

						
						<div class="form-block">
							<label for="email">Email Address*</label>
							<input type="email" id="email" name="email" value="{{$user->email}}" required>
						</div>

						<div class="form-block">
							<label for="your_last_name">Fullname*</label>
							<input type="text" id="your_last_name" name="fullname" value="{{$user->full_name}}" required>
						</div>

						<div class="form-block">
							<label for="adress">Address*</label>
							<input type="text" id="adress" name="address" value="{{$user->address}}" required>
						</div>


						<div class="form-block">
							<label for="phone">Phone*</label>
							<input type="text" name="phone" value="{{$user->phone}}" required>
						</div>
						<div class="form-block">
							<button type="submit" class="btn btn-primary">Cập nhật</button>
						</div>
					</div>
					<div class="col-sm-3"></div>
				</div>
			</form>
		</div> <!-- #content -->
	</div> <!-- .container -->
@endsection