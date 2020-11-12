<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEmailNotifsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('email_notifs', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("from");
            $table->foreign('from')->references('id')->on('users');
            $table->unsignedBigInteger("to");
            $table->foreign('to')->references('id')->on('users');
            $table->string("message");
            $table->string("file")->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('email_notifs');
    }
}
