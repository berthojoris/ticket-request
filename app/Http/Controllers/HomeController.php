<?php

namespace App\Http\Controllers;

use App\FormRequest;
use App\FormRequestHistory;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('home');
    }

    public function history()
    {
        return FormRequest::with('detail')->get();
    }

    public function fr($id)
    {
        return FormRequestHistory::with('formRequest')->whereId($id)->firstOrFail();
    }
}
