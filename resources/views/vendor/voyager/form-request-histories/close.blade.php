@extends('voyager::master')

@section('page_title', 'Close Ticket')

@section('page_header')
    <div class="container-fluid">
        <h1 class="page-title">
            <i class="voyager-browser"></i> Close Ticket
        </h1>
    </div>
@stop

@section('content')
<div class="page-content browse container-fluid">
    @include('voyager::alerts')
    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-bordered">
                <div class="panel-body">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="Name" value="">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@stop
