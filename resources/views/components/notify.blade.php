<div class="card">
    <div class="card-header-{{ $color }}">Notification</div>
    <div class="card-body">
        <h5 class="card-title">{{ $title }} </h5>
        <p class="card-text">{{ $text }}</p>
        @if ($btnShow == "show")
            <a href="{{ $btnLink }}" class="btn btn-primary">{{ $btnText }}</a>
        @endif
    </div>
</div>
