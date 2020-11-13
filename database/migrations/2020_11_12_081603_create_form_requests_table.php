<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFormRequestsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('form_requests', function (Blueprint $table) {
            $table->id();
            $table->uuid("uuid");
            $table->string("project_id");
            $table->string("program_name");
            $table->string("project_name");
            $table->longText("background");
            $table->longText("objective");
            $table->longText("target_audience");
            $table->longText("channels");
            $table->longText("digital_assets");
            $table->longText("creative_consideration");
            $table->longText("support_from_other_channel");
            $table->longText("competitor");
            $table->longText("kpi");
            $table->longText("requirement_rules");
            $table->longText("reference");
            $table->date("campaign_period_start");
            $table->date("campaign_period_end");
            $table->date("development_deadline_start");
            $table->date("development_deadline_end");
            $table->double("budget", 13, 0);
            $table->unsignedBigInteger("requested_id");
            $table->foreign('requested_id')->references('id')->on('users');
            $table->unsignedBigInteger("received_id");
            $table->foreign('received_id')->references('id')->on('users');
            $table->enum("status", ["open", "closed"])->default("open");
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
        Schema::dropIfExists('form_requests');
    }
}
