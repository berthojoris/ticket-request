<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Str;
use TCG\Voyager\Models\Role;
use TCG\Voyager\Models\User;

class UsersTableSeeder extends Seeder
{
    /**
     * Auto generated seed file.
     *
     * @return void
     */
    public function run()
    {
        if (User::count() == 0) {
            $role = Role::where('name', 'admin')->firstOrFail();

            $data = [
                [
                    'name'           => 'Bertho',
                    'email'          => 'berthojoris@gmail.com',
                    'password'       => bcrypt('malaquena'),
                    'remember_token' => Str::random(60),
                    'role_id'        => $role->id,
                ],
                [
                    'name'           => 'Tania',
                    'email'          => 'tania@gmail.com',
                    'password'       => bcrypt('malaquena'),
                    'remember_token' => Str::random(60),
                    'role_id'        => $role->id,
                ],
                [
                    'name'           => 'Bagus',
                    'email'          => 'bagus@gmail.com',
                    'password'       => bcrypt('malaquena'),
                    'remember_token' => Str::random(60),
                    'role_id'        => $role->id,
                ],
                [
                    'name'           => 'Brand',
                    'email'          => 'brand@gmail.com',
                    'password'       => bcrypt('malaquena'),
                    'remember_token' => Str::random(60),
                    'role_id'        => $role->id,
                ]
            ];
            User::create($data);
        }
    }
}
