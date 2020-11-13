<?php

namespace App\Observers;

use App\FormRequestHistory;

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
        //
    }

    /**
     * Handle the form request history "updated" event.
     *
     * @param  \App\FormRequestHistory  $formRequestHistory
     * @return void
     */
    public function updated(FormRequestHistory $formRequestHistory)
    {
        //
    }

    /**
     * Handle the form request history "deleted" event.
     *
     * @param  \App\FormRequestHistory  $formRequestHistory
     * @return void
     */
    public function deleted(FormRequestHistory $formRequestHistory)
    {
        //
    }

    /**
     * Handle the form request history "restored" event.
     *
     * @param  \App\FormRequestHistory  $formRequestHistory
     * @return void
     */
    public function restored(FormRequestHistory $formRequestHistory)
    {
        //
    }

    /**
     * Handle the form request history "force deleted" event.
     *
     * @param  \App\FormRequestHistory  $formRequestHistory
     * @return void
     */
    public function forceDeleted(FormRequestHistory $formRequestHistory)
    {
        //
    }
}
