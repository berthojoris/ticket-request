<?php

namespace App\Observers;

use App\BrandUser;
use App\FormRequest;
use Illuminate\Support\Str;

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
        //
    }

    /**
     * Handle the form request "updated" event.
     *
     * @param  \App\FormRequest  $formRequest
     * @return void
     */
    public function updated(FormRequest $formRequest)
    {
        //
    }

    /**
     * Handle the form request "deleted" event.
     *
     * @param  \App\FormRequest  $formRequest
     * @return void
     */
    public function deleted(FormRequest $formRequest)
    {
        //
    }

    /**
     * Handle the form request "restored" event.
     *
     * @param  \App\FormRequest  $formRequest
     * @return void
     */
    public function restored(FormRequest $formRequest)
    {
        //
    }

    /**
     * Handle the form request "force deleted" event.
     *
     * @param  \App\FormRequest  $formRequest
     * @return void
     */
    public function forceDeleted(FormRequest $formRequest)
    {
        //
    }
}
