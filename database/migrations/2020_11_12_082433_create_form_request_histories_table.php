<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFormRequestHistoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('form_request_histories', function (Blueprint $table) {
            $table->id();
            $table->enum("status", ['accepted', 'on_progress', 'pending', 'canceled', 'done', 'closed']);
            $table->longText("note")->nullable();
            $table->string("document_attached")->nullable();
            $table->unsignedBigInteger("created_by");
            $table->foreign('created_by')->references('id')->on('users');
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
        Schema::dropIfExists('form_request_histories');
    }
}
