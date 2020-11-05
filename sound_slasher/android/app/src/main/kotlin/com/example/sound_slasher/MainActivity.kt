package com.example.sound_slasher

import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "sound_slasher.flutter.dev/sound_slasher"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            when (call.method) {
                // "someMethod" from self do result.success(*result*)
                // or result.error(*error_code*, *error_msg*, *details(may be null)*)
                "someMethod" -> {
                    val someResult = someMethod()
                    if (someResult == CHANNEL) {
                        result.success(someResult)
                    } else {
                        result.error(
                                "SOME_FUKK_UP",
                                "Something went wrong",
                                null
                        )
                    }
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun someMethod(): String {
        return CHANNEL
    }
}
