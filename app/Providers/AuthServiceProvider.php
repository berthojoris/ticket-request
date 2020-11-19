<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        // 'App\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        Gate::define('browse_close-ticket', function ($user) {
            return $user->hasPermission('browse_close-ticket');
        });

        Gate::define('edit_closeticket', function ($user) {
            return $user->hasPermission('edit_closeticket');
        });

        Gate::define('browse_request_history', function ($user) {
            return $user->hasPermission('browse_request_history');
        });
    }
}
