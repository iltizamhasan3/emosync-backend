<?php

namespace Database\Seeders;

use App\Models\Subscription;
use App\Models\User;
use Illuminate\Database\Seeder;

class SubscriptionSeeder extends Seeder
{
    public function run(): void
    {
        $user = User::where('username', 'demasaxel')->first();
        if (!$user) {
            $user = User::where('email', 'demas@example.com')->first();
        }
        if ($user) {
            Subscription::create([
                'user_id' => $user->id,
                'plan' => 'monthly',
                'status' => 'active',
                'expires_at' => now()->addDays(30),
            ]);
            $user->is_premium = true;
            $user->premium_plan = 'monthly';
            $user->premium_expiry = now()->addDays(30);
            $user->save();
        }
    }
}
