class EnvironmentConfig {
  static const publicSupabaseUrl = String.fromEnvironment(
    'PUBLIC_SUPABASE_URL',
    defaultValue: "https://your.supabase.co",
  );

  static const publicSupabaseAnonKey = String.fromEnvironment(
    'PUBLIC_SUPABASE_ANON_KEY',
    defaultValue: "your.supabase.anonkey",
  );

  static const webClientId = String.fromEnvironment(
    'WEB_CLIENT_ID',
    defaultValue: "your-web-client-id.apps.googleusercontent.com",
  );

  static const androidClientId = String.fromEnvironment(
    'ANDROID_CLIENT_ID',
    defaultValue: "your-android-client-id.apps.googleusercontent.com",
  );
}
