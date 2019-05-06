@extends('master')
@section('content')
<div class="inner-header">
		<div class="container">
			<div class="pull-left">
				<h6 class="inner-title">Sản Phẩm</h6>
			</div>
			<div class="pull-right">
				<div class="beta-breadcrumb font-large">
					<a href="{{route('trang-chu')}}">Trang Chủ</a> / <span>Thông Tin Sản Phẩm</span>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>

	<div class="container">
		<div id="content">
			<div class="row">
				<div class="col-sm-9">

					<div class="row">
						<div class="col-sm-4">
							<img src="source/image/product/{{$sanpham->image}}" alt="">
						</div>
						<div class="col-sm-8">
							<div class="single-item-body">
								@if($sanpham->promotion_price!=0)
										<div class="ribbon-wrapper"><div class="ribbon sale">Sale</div></div>
										@endif
								<p class="single-item-title"><h2>{{$sanpham->name}}</h2></p>
								<p class="single-item-price">
									@if($sanpham->promotion_price==0)
												<span class="flash-sale">{{number_format($sanpham->unit_price)}} VNĐ</span>
											@else
												<span class="flash-del">{{number_format($sanpham->unit_price)}} VNĐ</span>
												<span class="flash-sale">{{number_format($sanpham->promotion_price)}} VNĐ</span>
											@endif
								</p>
							</div>

							<div class="clearfix"></div>
							<div class="space20">&nbsp;</div>

							<div class="single-item-desc">
								<p>{{$sanpham->description}}.</p>
							</div>
							<div class="space20">&nbsp;</div>

							<p>Số lượng:</p>
							<form action="{{route('themgiohang',$sanpham->id)}}" method="get" class="beta-form-checkout">
								<select class="wc-select" name="color">
									<option disabled>Số Lượng</option>
									<option value=1>1</option>
									<option value=2>2</option>
									<option value=3>3</option>
									<option value=4>4</option>
									<option value=5>5</option>
									<option value=6>6</option>
									<option value=7>7</option>
									<option value=8>8</option>
									<option value=9>9</option>
									<option value=10>10</option>
								</select>
								<button class="add-to-cart" type="submit"><i class="fa fa-shopping-cart"></i></button>
								<div class="clearfix"></div>
							</form>
							</div>

						</div>
					</div>

					<div class="space40">&nbsp;</div>
					<div class="woocommerce-tabs">
						<ul class="tabs">
							<li><a href="#tab-description">Mô tả</a></li>
						</ul>

						<div class="panel" id="tab-description">
							<p>{{$sanpham->description}}.</p>
						</div>
					</div>
					<div class="space50">&nbsp;</div>
					<div class="beta-products-list">
						<h4>Sản Phẩm Tương Tự</h4>

						<div class="row">
							@foreach($sptt as $tt)
							<div class="col-sm-4">
								<div class="single-item">
									@if($tt->promotion_price!=0)
										<div class="ribbon-wrapper"><div class="ribbon sale">Sale</div></div>
										@endif
									<div class="single-item-header">
										<a href="{{route('chitietsanpham',$tt->id)}}"><img src="source/image/product/{{$tt->image}}" alt="" height="250px"></a>
									</div>
									<div class="single-item-body">
										<p class="single-item-title">{{$tt->name}}</p>
										<p class="single-item-price">
										@if($tt->promotion_price==0)
												<span class="flash-sale">{{number_format($tt->unit_price)}} VNĐ</span>
											@else
												<span class="flash-del">{{number_format($tt->unit_price)}} VNĐ</span>
												<span class="flash-sale">{{number_format($tt->promotion_price)}} VNĐ</span>
											@endif
										</p>
									</div>
									<div class="single-item-caption">
										<a class="add-to-cart pull-left" href="{{route('themgiohang',$tt->id)}}"><i class="fa fa-shopping-cart"></i></a>
										<a class="beta-btn primary" href="{{route('chitietsanpham',$tt->id)}}">Chi Tiết <i class="fa fa-chevron-right"></i></a>
										<div class="clearfix"></div>
									</div>
								</div>
							</div>
							@endforeach
						</div>
						<div class="row">{{$sptt->links()}}</div>
					</div> <!-- .beta-products-list -->
				</div>
				
			</div>
		</div> <!-- #content -->
	</div> <!-- .container -->
@endsection