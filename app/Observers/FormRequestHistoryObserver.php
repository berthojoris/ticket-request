<?php

namespace App\Observers;

use App\Log;
use App\FormRequestHistory;
use hisorange\BrowserDetect\Parser as Browser;

class FormRequestHistoryObserver
{
    public function saving(FormRequestHistory $formRequestHistory)
    {
        $formRequestHistory->created_by = auth()->user()->id;
    }
    /**
     * Handle the form request history "created" event.
     *
     * @param  \App\FormRequestHistory  $formRequestHistory
     * @return void
     */
    public function created(FormRequestHistory $formRequestHistory)
    {
        $routeArray = app('request')->route()->getAction();
        $controllerAction = class_basename($routeArray['controller']);
        list($controller, $action) = explode('@', $controllerAction);

        Log::create([
            'controller' => $controller,
            'function' => $action,
            'current_url' => url()->full(),
            'payload' => $formRequestHistory,
            'browser' => Browser::browserName(),
            'ip_address' => request()->ip(),
            'user_id' => auth()->user()->id
        ]);
    }

    /**
     * Handle the form request history "updated" event.
     *
     * @param  \App\FormRequestHistory  $formRequestHistory
     * @return void
     */
    public function updated(FormRequestHistory $formRequestHistory)
    {
        $routeArray = app('request')->route()->getAction();
        $controllerAction = class_basename($routeArray['controller']);
        list($controller, $action) = explode('@', $controllerAction);

        Log::create([
            'controller' => $controller,
            'function' => $action,
            'current_url' => url()->full(),
            'payload' => $formRequestHistory,
            'browser' => Browser::browserName(),
            'ip_address' => request()->ip(),
            'user_id' => auth()->user()->id
        ]);
    }

    /**
     * Handle the form request history "deleted" event.
     *
     * @param  \App\FormRequestHistory  $formRequestHistory
     * @return void
     */
    public function deleted(FormRequestHistory $formRequestHistory)
    {
        $routeArray = app('request')->route()->getAction();
        $controllerAction = class_basename($routeArray['controller']);
        list($controller, $action) = explode('@', $controllerAction);

        Log::create([
            'controller' => $controller,
            'function' => $action,
            'current_url' => url()->full(),
            'payload' => $formRequestHistory,
            'browser' => Browser::browserName(),
            'ip_address' => request()->ip(),
            'user_id' => auth()->user()->id
        ]);
    }

    /**
     * Handle the form request history "restored" event.
     *
     * @param  \App\FormRequestHistory  $formRequestHistory
     * @return void
     */
    public function restored(FormRequestHistory $formRequestHistory)
    {
        $routeArray = app('request')->route()->getAction();
        $controllerAction = class_basename($routeArray['controller']);
        list($controller, $action) = explode('@', $controllerAction);

        Log::create([
            'controller' => $controller,
            'function' => $action,
            'current_url' => url()->full(),
            'payload' => $formRequestHistory,
            'browser' => Browser::browserName(),
            'ip_address' => request()->ip(),
            'user_id' => auth()->user()->id
        ]);
    }

    /**
     * Handle the form request history "force deleted" event.
     *
     * @param  \App\FormRequestHistory  $formRequestHistory
     * @return void
     */
    public function forceDeleted(FormRequestHistory $formRequestHistory)
    {
        $routeArray = app('request')->route()->getAction();
        $controllerAction = class_basename($routeArray['controller']);
        list($controller, $action) = explode('@', $controllerAction);

        Log::create([
            'controller' => $controller,
            'function' => $action,
            'current_url' => url()->full(),
            'payload' => $formRequestHistory,
            'browser' => Browser::browserName(),
            'ip_address' => request()->ip(),
            'user_id' => auth()->user()->id
        ]);
    }
}
