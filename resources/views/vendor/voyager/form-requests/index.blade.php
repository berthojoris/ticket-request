@extends('voyager::master')

@section('page_title', 'Progress Detail')

@section('page_header')
    <div class="container-fluid">
        <h1 class="page-title">
            <i class="voyager-browser"></i> Progress - Project ID {{ $datas->project_id }}
        </h1>
    </div>
@stop

@section('content')
<div class="page-content browse container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="timeline">
                @foreach ($datas->detail as $data)
                    <div class="entry">
                        <div class="title">
                            <h3 class="{{ colorRand() }}">{{ $datas->project_name }}</h3>
                            <p>{{ $datas->program_name }}</p>
                            <p>Updated ( {{ timeAgo($datas->created_at) }} ) </p>
                        </div>
                        <div class="body">
                            <p>{!! $data->note !!}</p>
                            @if (isDownload($data->document_attached) == true)
                            <a class="{{ colorRand() }}"
                                target="_blank"
                                href="{{ Storage::disk(config('voyager.storage.disk'))->url(downloadLink($data->document_attached)) }}">
                                Download {{ downloadFileName($data->document_attached) }}
                            </a>
                            @endif
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
</div>
@stop
