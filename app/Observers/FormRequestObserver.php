<?php

namespace App\Observers;

use App\Log;
use App\BrandUser;
use App\FormRequest;
use Illuminate\Support\Str;
use hisorange\BrowserDetect\Parser as Browser;

class FormRequestObserver
{
    public function saving(FormRequest $formRequest)
    {
        $userLogin = auth()->user()->id;
        $brandUser = BrandUser::whereUserId($userLogin)->firstOrFail();
        $formRequest->requested_id = $userLogin;
        $formRequest->uuid = Str::uuid();
        $formRequest->brand_id = $brandUser->brand_id;
    }
    /**
     * Handle the form request "created" event.
     *
     * @param  \App\FormRequest  $formRequest
     * @return void
     */
    public function created(FormRequest $formRequest)
    {
        $routeArray = app('request')->route()->getAction();
        $controllerAction = class_basename($routeArray['controller']);
        list($controller, $action) = explode('@', $controllerAction);

        Log::create([
            'controller' => $controller,
            'function' => $action,
            'current_url' => url()->full(),
            'payload' => $formRequest,
            'browser' => Browser::browserName(),
            'ip_address' => request()->ip(),
            'user_id' => auth()->user()->id
        ]);
    }

    /**
     * Handle the form request "updated" event.
     *
     * @param  \App\FormRequest  $formRequest
     * @return void
     */
    public function updated(FormRequest $formRequest)
    {
        $routeArray = app('request')->route()->getAction();
        $controllerAction = class_basename($routeArray['controller']);
        list($controller, $action) = explode('@', $controllerAction);

        Log::create([
            'controller' => $controller,
            'function' => $action,
            'current_url' => url()->full(),
            'payload' => $formRequest,
            'browser' => Browser::browserName(),
            'ip_address' => request()->ip(),
            'user_id' => auth()->user()->id
        ]);
    }

    /**
     * Handle the form request "deleted" event.
     *
     * @param  \App\FormRequest  $formRequest
     * @return void
     */
    public function deleted(FormRequest $formRequest)
    {
        $formRequest->detail()->delete();

        $routeArray = app('request')->route()->getAction();
        $controllerAction = class_basename($routeArray['controller']);
        list($controller, $action) = explode('@', $controllerAction);

        Log::create([
            'controller' => $controller,
            'function' => $action,
            'current_url' => url()->full(),
            'payload' => $formRequest,
            'browser' => Browser::browserName(),
            'ip_address' => request()->ip(),
            'user_id' => auth()->user()->id
        ]);
    }

    /**
     * Handle the form request "restored" event.
     *
     * @param  \App\FormRequest  $formRequest
     * @return void
     */
    public function restored(FormRequest $formRequest)
    {
        $routeArray = app('request')->route()->getAction();
        $controllerAction = class_basename($routeArray['controller']);
        list($controller, $action) = explode('@', $controllerAction);

        Log::create([
            'controller' => $controller,
            'function' => $action,
            'current_url' => url()->full(),
            'payload' => $formRequest,
            'browser' => Browser::browserName(),
            'ip_address' => request()->ip(),
            'user_id' => auth()->user()->id
        ]);
    }

    /**
     * Handle the form request "force deleted" event.
     *
     * @param  \App\FormRequest  $formRequest
     * @return void
     */
    public function forceDeleted(FormRequest $formRequest)
    {
        $routeArray = app('request')->route()->getAction();
        $controllerAction = class_basename($routeArray['controller']);
        list($controller, $action) = explode('@', $controllerAction);

        Log::create([
            'controller' => $controller,
            'function' => $action,
            'current_url' => url()->full(),
            'payload' => $formRequest,
            'browser' => Browser::browserName(),
            'ip_address' => request()->ip(),
            'user_id' => auth()->user()->id
        ]);
    }
}
