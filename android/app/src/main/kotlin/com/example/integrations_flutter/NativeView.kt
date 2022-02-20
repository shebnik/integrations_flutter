package com.example.integrations_flutter

import android.content.Context
import android.content.Intent
import android.text.Editable
import android.text.TextWatcher
import android.view.View
import android.widget.Button
import android.widget.EditText
import android.widget.LinearLayout
import android.widget.TableLayout
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.platform.PlatformView
import kotlin.random.Random

class AndroidEditTextView(context: Context, id: Int, creationParams: Map<String?, Any?>?, messenger: BinaryMessenger) : PlatformView {

    private val editText: EditText = EditText(context)

    private val intentName = "EVENTS"
    private val intentMessageId = "CALL"

    override fun getView(): View {
        return editText
    }

    override fun dispose() {
    }

    init {
        editText.textSize = 14f
        editText.addTextChangedListener(object : TextWatcher {
            override fun afterTextChanged(s: Editable?) {
            }

            override fun beforeTextChanged(s: CharSequence?, start: Int, count: Int, after: Int) {
            }

            override fun onTextChanged(s: CharSequence?, start: Int, before: Int, count: Int) {
                val intent = Intent(intentName)
                intent.putExtra(intentMessageId, editText.text)
                context.sendBroadcast(intent)
            }

        })
    }
}