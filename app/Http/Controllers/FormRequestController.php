<?php

namespace App\Http\Controllers;

use App\FormRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class FormRequestController extends Controller
{

    // TODO: Tambahkan authorize ke AuthServiceProvider

    public function list()
    {
        $this->authorize('browse_close-ticket');
        return view('vendor.voyager.form-request-histories.list');
    }

    public function closeTicket($id)
    {
        $this->authorize('edit_closeticket');
        return view('vendor.voyager.form-request-histories.close');
    }

    public function detailRequest($id)
    {
        $this->authorize('browse_request_history');
        $datas = FormRequest::with(
            [
                'detail',
                'senderName' => function ($query) {
                    $query->select(['id', 'name']);
                }
            ]
        )->whereId($id)->when(isAdmin(), function ($query) {
            return $query->where('received_id', userID());
        })->first();
        if (empty($datas)) {
            return view('vendor.voyager.form-requests.empty');
        } else {
            return view('vendor.voyager.form-requests.index', compact('datas'));
        }
    }
}
