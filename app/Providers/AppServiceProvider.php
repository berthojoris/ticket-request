<?php

namespace App\Providers;

use App\Brand;
use App\FormRequest;
use App\FormRequestHistory;
use App\Actions\TimelineBtn;
use App\View\Components\Notify;
use App\Observers\BrandObserver;
use TCG\Voyager\Facades\Voyager;
use Illuminate\Support\Facades\Blade;
use App\Observers\FormRequestObserver;
use Illuminate\Support\ServiceProvider;
use App\Observers\FormRequestHistoryObserver;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Blade::component('notify', Notify::class);
        Brand::observe(BrandObserver::class);
        FormRequest::observe(FormRequestObserver::class);
        FormRequestHistory::observe(FormRequestHistoryObserver::class);
        Voyager::addAction(TimelineBtn::class);
    }
}
