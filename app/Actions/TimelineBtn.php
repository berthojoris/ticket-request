<?php

namespace App\Actions;

use TCG\Voyager\Actions\AbstractAction;

class TimelineBtn extends AbstractAction
{
    public function getTitle()
    {
        return 'History';
    }

    public function getIcon()
    {
        return 'voyager-fire';
    }

    public function getPolicy()
    {
        return 'read';
    }

    public function getAttributes()
    {
        return [
            'class' => 'btn btn-sm btn-detail pull-right mr-5',
        ];
    }

    public function shouldActionDisplayOnDataType()
    {
        return $this->dataType->slug == 'form-requests';
    }

    public function getDefaultRoute()
    {
        return route('detailRequest', ['id' => $this->data->id]);
    }
}
