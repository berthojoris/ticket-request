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
        $datas = FormRequest::with('detail')->whereId($id)->latest()->first();
        return view('vendor.voyager.form-requests.index', compact('datas'));
    }
}
