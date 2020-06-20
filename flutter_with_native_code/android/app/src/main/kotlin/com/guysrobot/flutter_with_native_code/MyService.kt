package com.guysrobot.flutter_with_native_code

import android.app.NotificationManager
import android.app.Service
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.IBinder
import androidx.core.app.NotificationCompat

class MyService : Service() {
    override fun onCreate() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O){
            val  builder = NotificationCompat.Builder(this, "messages")
                    .setContentText("This running in background")
                    .setContentTitle("Flutter With Native Service")
                    .setSmallIcon(R.drawable.ic_style_black_24dp)
            startForeground(12, builder.build())
        }

        }
    override fun onBind(p0: Intent?): IBinder? {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }
}