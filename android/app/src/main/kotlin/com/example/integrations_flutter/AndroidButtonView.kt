package com.example.integrations_flutter

import android.content.Context
import android.content.Intent
import android.view.View
import android.widget.Button
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.platform.PlatformView
import kotlin.random.Random

class AndroidButtonView(context: Context, id: Int, creationParams: Map<String?, Any?>?, messenger: BinaryMessenger) : PlatformView {

    private val button: Button = Button(context)

    private val intentName = "EVENTS"
    private val intentMessageId = "CALL"

    override fun getView(): View {
        return button
    }

    override fun dispose() {
    }

    init {
        button.textSize = 14f
        button.text = "Android Native Button"
        button.setOnClickListener {
            val intent = Intent(intentName)
            val rand = Random.nextInt(0, 500)
            intent.putExtra(intentMessageId, rand)
            context.sendBroadcast(intent)
        }
    }
}