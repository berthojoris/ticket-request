<?php

if (! function_exists('colorRand')) {
    function colorRand() {
        $array = [
            'tealColor',
            'blueColor',
            'yelowColor',
            'grayColor',
            'redColor',
            'cyanColor',
            'purpleColor'
        ];
        $random = Arr::random($array);
        return $random;
    }
}
