package com.guysrobot.flutter_with_native_code

import android.content.Intent
import android.os.Build
import android.os.Bundle
import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class ActivityL : FlutterActivity() {
    private lateinit var service : Intent
    override fun onCreate(savedInstanceState: Bundle?) {
        service = Intent(this, MyService::class.java)
        super.onCreate(savedInstanceState)
        MethodChannel(flutterView, "Rosie").setMethodCallHandler{ call, result ->
            if (call.method == "startService"){
                startService()
                result.success("Success!")
            }
        }
    }
    private fun startService() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            startForegroundService(service)
        } else {
            startService(service)
        }
    }

    override fun onDestroy() {
        super.onDestroy()
        stopService(service)
    }

}