package com.example.integrations

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.example.integrations.databinding.ActivityMainBinding
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.MethodChannel
import java.util.*


class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding
    lateinit var flutterEngine: FlutterEngine

    private val androidViewId = "INTEGRATION_ANDROID"
    private val methodChannel = "CALL_METHOD"
    private val intentMessageId = "CALL"


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        flutterEngine = FlutterEngine(this)

        flutterEngine.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()
        )

        FlutterEngineCache
            .getInstance()
            .put(androidViewId, flutterEngine)


        startActivity(
            FlutterActivity
                .withCachedEngine(androidViewId)
                .build(this)
        )

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, methodChannel).setMethodCallHandler { call, result ->
            if (call.method == intentMessageId) {
                result.success(Random().nextInt(500))
            } else {
                result.notImplemented()
            }
        }
    }
}