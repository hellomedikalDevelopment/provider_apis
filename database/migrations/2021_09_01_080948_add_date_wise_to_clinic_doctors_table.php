<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddDateWiseToClinicDoctorsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('clinic_doctors', function (Blueprint $table) {
          $table->longText('date_wise')->nullable()->after('doctor_id');
          $table->longText('day_wise')->nullable()->after('doctor_id');
          $table->longText('day_delete')->nullable()->after('doctor_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('clinic_doctors', function (Blueprint $table) {
            $table->dropColumn('doctor_id');
             $table->dropColumn('date_wise');
              $table->dropColumn('day_wise');
        });
    }
}
