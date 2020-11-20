<?php

use Carbon\Carbon;

if (! function_exists('colorRand')) {
    function colorRand() {
        $array = [
            'tealColor',
            'blueColor',
            'yelowColor',
            'redColor',
            'cyanColor',
            'purpleColor'
        ];
        $random = Arr::random($array);
        return $random;
    }
}

if (! function_exists('downloadLink')) {
    function downloadLink($data) {
        $new_file = json_decode($data, true);
        if(count($new_file) > 0) {
            $downloadLink = $new_file[0]['download_link'];
            return $downloadLink;
        }
    }
}

if (! function_exists('downloadFileName')) {
    function downloadFileName($data) {
        $new_file = json_decode($data, true);
        if(count($new_file) > 0) {
            $originalName = $new_file[0]['original_name'];
            return $originalName;
        }
    }
}

if (! function_exists('isDownload')) {
    function isDownload($data) {
        $new_file = json_decode($data, true);
        if(count($new_file) > 0) {
           return true;
        } else {
            return false;
        }
    }
}

if (! function_exists('timeAgo')) {
    function timeAgo($data) {
        return Carbon::createFromTimeStamp(strtotime($data))->diffForHumans();
    }
}

