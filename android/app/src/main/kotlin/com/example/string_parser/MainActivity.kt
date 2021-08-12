package com.example.string_parser

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.string_parser/okAuth"

  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
      call, result ->
      // Note: this method is invoked on the main thread.
      // TODO
    }
  }

  String APP_ID = "512000873787";
  String APP_KEY = "CMDGFCKGDIHBABABA";

    Odnoklassniki odnoklassniki = Odnoklassniki.createInstance(this, APP_ID, APP_KEY);

  public fun okAuth(){
        odnoklassniki.requestAuthorization(listener, REDIRECT_URL, OkScope.VALUABLE_ACCESS, OkScope.LONG_ACCESS_TOKEN);
        var result = odnoklassniki.request("users.getCurrentUser", null, "get");
        print(result)
  }
}
