<?php

namespace App\Providers;

use App\Brand;
use App\FormRequest;
use App\FormRequestHistory;
use App\Actions\TimelineBtn;
use App\Observers\BrandObserver;
use TCG\Voyager\Facades\Voyager;
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
        Brand::observe(BrandObserver::class);
        FormRequest::observe(FormRequestObserver::class);
        FormRequestHistory::observe(FormRequestHistoryObserver::class);
        Voyager::addAction(TimelineBtn::class);
    }
}
