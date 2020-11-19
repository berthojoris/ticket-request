<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');


// https://voyager-docs.devdojo.com/core-concepts/roles-and-permissions

Route::group(['prefix' => 'admin'], function () {
    Route::get('/request-history/{id}', 'FormRequestController@detailRequest')->name('detailRequest');
    Voyager::routes();
});

Route::get('/history', 'HomeController@history')->name('history');
Route::get('/fr/{id}', 'HomeController@fr')->name('fr');
