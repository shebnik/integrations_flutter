package com.example.integrations_flutter

import android.content.Context
import android.graphics.Color
import android.view.View
import android.widget.TextView
import io.flutter.plugin.platform.PlatformView

class NativeView(context: Context, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {

    val textView: TextView = TextView(context)

    override fun getView(): View {
        return textView
    }

    override fun dispose() {}

    init {
        textView.setBackgroundColor(Color.rgb(255, 255, 255))
        textView.setTextColor(Color.BLACK)
        textView.text = "This text rendered on a native Android view (id: $id)"
    }
}