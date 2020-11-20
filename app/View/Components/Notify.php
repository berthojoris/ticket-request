<?php

namespace App\View\Components;

use Illuminate\View\Component;

class Notify extends Component
{
    public $title;
    public $text;
    public $color;
    public $btnShow;
    public $btnText;
    public $btnLink;

    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct(
        $title,
        $text,
        $color = "green",
        $btnShow = "show",
        $btnText = "Reload page",
        $btnLink = "home"
    ) {
        $this->title = $title;
        $this->text = $text;
        $this->color = $color;
        $this->btnShow = $btnShow;
        $this->btnText = $btnText;
        $this->btnLink = ($btnLink == "home") ? url('/admin') : $btnLink;
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\View\View|string
     */
    public function render()
    {
        return view('components.notify');
    }
}
