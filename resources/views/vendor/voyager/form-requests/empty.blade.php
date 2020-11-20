@extends('voyager::master')

@section('page_title', 'Progress Detail')

@section('page_header')
    <div class="container-fluid">
        <h1 class="page-title">
            <i class="voyager-browser"></i> Data Not Found
        </h1>
    </div>
@stop

@section('content')
<div class="page-content browse container-fluid">
    <div class="row">
        <div class="col-md-12">
            <x-notify
                title="Your request data not found"
                text=""
                btnShow="show"
                btnText="Back to list"
                :btnLink="url('/admin/form-requests')"
            />
        </div>
    </div>
</div>
@stop
