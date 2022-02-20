package com.example.integrations_flutter

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    private val androidViewId = "INTEGRATION_ANDROID"
    private val methodChannel = "CALL_METHOD"
    private val intentMessageId = "CALL"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        val nativeViewFactory = NativeViewFactory()

        flutterEngine
            .platformViewsController
            .registry
            .registerViewFactory(androidViewId, nativeViewFactory)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, methodChannel).setMethodCallHandler { call, result ->
            if (call.method == intentMessageId) {
                nativeViewFactory.nativeView.textView.text = call.arguments as String
            } else {
                result.notImplemented()
            }
        }
    }
}
