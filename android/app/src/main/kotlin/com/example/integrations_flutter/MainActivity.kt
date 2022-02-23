package com.example.integrations_flutter

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.Pigeon

class MainActivity : FlutterActivity() {

    private val androidViewId = "INTEGRATION_ANDROID"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        val nativeViewFactory = NativeViewFactory()

        flutterEngine
            .platformViewsController
            .registry
            .registerViewFactory(androidViewId, nativeViewFactory)

        Pigeon.NativeApi.setup(flutterEngine.dartExecutor.binaryMessenger, MyNativeApi(nativeViewFactory = nativeViewFactory))
    }

    private class MyNativeApi(val nativeViewFactory: NativeViewFactory): Pigeon.NativeApi {

        override fun setValue(value: String?) {
            nativeViewFactory.nativeView.textView.text = value
        }

    }
}
