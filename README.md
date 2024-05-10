![✨ Mock Up](https://github.com/Shafnaa/gym8-flutter/assets/88240429/90cadf26-78d8-4125-bc27-cc55de81063e)


# 👋 About Gym8: Your Fitness Buddy!

Gym8 is a fitness buddy application that is perfect for someone looking to start a new lifestyle. This application is built using the Flutter Framework and Supabase, compatible with Android 11 devices. With Gym8, beginners can easily manage and choose recommended workout routines that suit them.

## Screenshot

<img src="https://github.com/Shafnaa/gym8-flutter/assets/88240429/7ce99930-736c-4243-9c5d-8862637198b4" alt="Sign In" width="300"><img src="https://github.com/Shafnaa/gym8-flutter/assets/88240429/fa95cc63-5116-42a2-9a62-ab8f3105ed1e" alt="Sign Up" width="300">

<img src="https://github.com/Shafnaa/gym8-flutter/assets/88240429/9705b03e-8d5c-433b-aaa0-bf392e597c80" alt="Home" width="300"><img src="https://github.com/Shafnaa/gym8-flutter/assets/88240429/afc7034a-a282-4e6b-97e2-c6e48ecb0b82" alt="Detail Page" width="300">

## How to run the app

1. Create new project in Supabase
2. Run this SQL query under the SQL query editor

````sql
CREATE TABLE "equipments"(
    "id" BIGINT NOT NULL,
    "name" TEXT NOT NULL
);
ALTER TABLE
    "equipments" ADD PRIMARY KEY("id");

CREATE TABLE "difficulties"(
    "id" BIGINT NOT NULL,
    "name" TEXT NOT NULL
);
ALTER TABLE
    "difficulties" ADD PRIMARY KEY("id");

CREATE TABLE "exercises"(
    "id" BIGINT NOT NULL,
    "name" TEXT NOT NULL,
    "instruction" TEXT NOT NULL,
    "muscle_id" BIGINT NOT NULL,
    "equipment_id" BIGINT NOT NULL,
    "difficulty_id" BIGINT NOT NULL,
    "type_id" BIGINT NOT NULL
);
ALTER TABLE
    "exercises" ADD PRIMARY KEY("id");

CREATE TABLE "profiles"(
    "user_id" UUID NOT NULL,
    "name" TEXT NOT NULL,
    "avatar_url" BIGINT NOT NULL
);
ALTER TABLE
    "profiles" ADD PRIMARY KEY("user_id");

CREATE TABLE "schedules"(
    "id" BIGINT NOT NULL,
    "split_id" BIGINT NOT NULL,
    "day_id" BIGINT NOT NULL,
    "user_id" UUID NOT NULL
);
ALTER TABLE
    "schedules" ADD PRIMARY KEY("id");

CREATE TABLE "splits"(
    "id" BIGINT NOT NULL,
    "name" TEXT NOT NULL
);
ALTER TABLE
    "splits" ADD PRIMARY KEY("id");

CREATE TABLE "exercises_schedules"(
    "exercise_id" BIGINT NOT NULL,
    "schedule_id" BIGINT NOT NULL
);
ALTER TABLE
    "exercises_schedules" ADD PRIMARY KEY("exercise_id");
ALTER TABLE
    "exercises_schedules" ADD PRIMARY KEY("schedule_id");

CREATE TABLE "types"(
    "id" BIGINT NOT NULL,
    "name" TEXT NOT NULL
);
ALTER TABLE
    "types" ADD PRIMARY KEY("id");

CREATE TABLE "days"(
    "id" BIGINT NOT NULL,
    "name" TEXT NOT NULL
);
ALTER TABLE
    "days" ADD PRIMARY KEY("id");

CREATE TABLE "muscles"(
    "id" BIGINT NOT NULL,
    "name" TEXT NOT NULL,
    "image_url" TEXT NOT NULL
);
ALTER TABLE
    "muscles" ADD PRIMARY KEY("id");

CREATE TABLE "histories"(
    "id" BIGINT NOT NULL,
    "user_id" UUID NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "histories" ADD PRIMARY KEY("id");

ALTER TABLE
    "schedules" ADD CONSTRAINT "schedules_user_id_foreign" FOREIGN KEY("user_id") REFERENCES auth.users("id");
ALTER TABLE
    "exercises" ADD CONSTRAINT "exercises_equipment_id_foreign" FOREIGN KEY("equipment_id") REFERENCES "equipments"("id");
ALTER TABLE
    "exercises" ADD CONSTRAINT "exercises_difficulty_id_foreign" FOREIGN KEY("difficulty_id") REFERENCES "difficulties"("id");
ALTER TABLE
    "exercises" ADD CONSTRAINT "exercises_id_foreign" FOREIGN KEY("id") REFERENCES "exercises_schedules"("exercise_id");
ALTER TABLE
    "exercises" ADD CONSTRAINT "exercises_type_id_foreign" FOREIGN KEY("type_id") REFERENCES "types"("id");
ALTER TABLE
    "histories" ADD CONSTRAINT "histories_user_id_foreign" FOREIGN KEY("user_id") REFERENCES auth.users("id");
ALTER TABLE
    "profiles" ADD CONSTRAINT "profiles_user_id_foreign" FOREIGN KEY("user_id") REFERENCES auth.users("id");
ALTER TABLE
    "exercises" ADD CONSTRAINT "exercises_muscle_id_foreign" FOREIGN KEY("muscle_id") REFERENCES "muscles"("id");
ALTER TABLE
    "schedules" ADD CONSTRAINT "schedules_split_id_foreign" FOREIGN KEY("split_id") REFERENCES "splits"("id");
ALTER TABLE
    "schedules" ADD CONSTRAINT "schedules_day_id_foreign" FOREIGN KEY("day_id") REFERENCES "days"("id");
ALTER TABLE
    "schedules" ADD CONSTRAINT "schedules_id_foreign" FOREIGN KEY("id") REFERENCES "exercises_schedules"("schedule_id");
````

3. Setup Supabase auth (email password & Google Oauth) following the docs
4. Install Flutter & Android Studio (Android 11 API 30)
5. Go to the lib directory
6. Create a new file under the lib directory called `main_config.dart`

````dart
class EnvironmentConfig {
  static const publicSupabaseUrl = String.fromEnvironment(
    'PUBLIC_SUPABASE_URL',
    defaultValue: "<YOUR-SUPABASE-URL>", 
  );
      
  static const publicSupabaseAnonKey = String.fromEnvironment(
    'PUBLIC_SUPABASE_ANON_KEY',
    defaultValue: "<YOUR-SUPABASE-ANON-KEY>",
  );
  
  static const webClientId = String.fromEnvironment(
    'WEB_CLIENT_ID',
    defaultValue: "<YOUR-GOOGLE-WEB-CLIENT-ID>",
  );
  
  static const androidClientId = String.fromEnvironment(
    'ANDROID_CLIENT_ID',
    defaultValue: "<YOUR-GOOGLE-ANDROID-CLIENT-ID>",
  );
}
````

8. Run this command to install dependency
   
```bash
$ flutter pub get
```

9. Run this command to run the app
   
```bash
$ flutter run
```
