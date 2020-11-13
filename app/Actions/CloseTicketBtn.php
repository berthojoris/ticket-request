<?php

namespace App\Actions;

use TCG\Voyager\Actions\AbstractAction;

class CloseTicketBtn extends AbstractAction
{
    public function getTitle()
    {
        return 'Close Ticket';
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
            'class' => 'btn btn-sm btn-success pull-right mr-5',
        ];
    }

    public function getDefaultRoute()
    {
        return route('voyager.closeticket', ['id' => $this->data->id]);
    }
}
