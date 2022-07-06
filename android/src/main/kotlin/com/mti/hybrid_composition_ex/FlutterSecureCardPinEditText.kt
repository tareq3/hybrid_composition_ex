package com.mti.hybrid_composition_ex

import android.content.Context
import android.content.res.ColorStateList
import android.graphics.Color
import android.os.Build
import android.text.InputType
import android.util.AttributeSet
import android.view.View
import android.view.ViewGroup
import android.view.inputmethod.InputMethodManager
import android.widget.EditText
import androidx.annotation.RequiresApi
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView


class FlutterSecureCardPinEditText : PlatformView, MethodChannel.MethodCallHandler {

    lateinit var editText: EditText
    lateinit var methodChannel: MethodChannel
    lateinit var context: Context
    var id: Int
    lateinit var gArgs: Map<String, Any?>
    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    constructor(
        context: android.content.Context,
        id: Int,
        messenger: BinaryMessenger,
        args: Any?
    ) : super() {
        this.context = context
        this.id = id
        methodChannel = MethodChannel(messenger, "weavr_components/secure_card_pin_edit_text_$id")
        methodChannel.setMethodCallHandler(this)
        val _args = args as Map<String, Any?>
        gArgs = _args
        editText = EditText(context) as EditText
//        editText.initialize(context, attrs = null)
//        editText.setBackgroundColor(Color.CYAN)

        val width = _args["width"] as Double
        editText.maxWidth = width.toInt()

        editText.maxHeight = (_args["height"] as Double).toInt()


        if (_args["color"] != null) {
            editText.setTextColor((_args["color"] as Long).toInt())
        }


        if (_args["placeholderColor"] != null) {
            editText.setHintTextColor((_args["placeholderColor"] as Long).toInt())
        } else {
            editText.setHintTextColor(Color.GRAY)
        }
        if (_args["placeholder"] != null) {
            editText.hint = (_args["placeholder"] as String)
        } else {
            editText.hint = "Enter Card Pin"
        }
        editText.isSingleLine = true


        if (_args["textSize"] != null) {
            editText.textSize = (_args["textSize"] as Double).toFloat()
        } else {
            editText.textSize = 16f
        }
        if (args["background"] != null && args["background"] == true) {
//            editText.setBackgroundResource(androidx.appcompat.R.drawable.abc_edit_text_material)
            editText.backgroundTintList =
                ColorStateList.valueOf(Color.GRAY)
            //editText.backgroundTintMode = PorterDuff.Mode.OVERLAY
        } else {
            editText.setBackgroundResource(0)
            editText.setPadding(0, 38, 0, 0)
        }
//        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
//            editText.setTextCursorDrawable(R.drawable.edit_text_cursor)
//        }






        editText.gravity = View.TEXT_ALIGNMENT_TEXT_START
        editText.inputType = InputType.TYPE_CLASS_NUMBER or InputType.TYPE_NUMBER_VARIATION_PASSWORD
//        editText.setMaxLength(4)
        editText.maxLines = 1
        editText.setOnFocusChangeListener { v, hasFocus ->
            if (hasFocus) {
                if (gArgs["hintColor"] != null) {
                    editText.backgroundTintList =
                        ColorStateList.valueOf((gArgs["hintColor"] as Long).toInt())
                }
//                methodChannel.invokeMethod("inputStarted", null)
            } else {
                editText.backgroundTintList =
                    ColorStateList.valueOf(Color.GRAY)
//                methodChannel.invokeMethod(
//                    "inputFinished",
//                    mapOf("text" to editText.text.toString())
//                )
            }
        }
    }

    override fun getView(): EditText? {
        return editText
    }

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "createToken" -> {
                //createToken(call, result)
            }
            "focus" -> {
                editText.requestFocus()
                showKeyboard()
                if (gArgs["hintColor"] != null) {
                    editText.backgroundTintList =
                        ColorStateList.valueOf((gArgs["hintColor"] as Long).toInt())
                }
            }
            "unfocus" -> {
                editText.clearFocus()
                hideKeyboard()
                editText.backgroundTintList =
                    ColorStateList.valueOf(Color.GRAY)
            }
            else -> {
                result.notImplemented()
            }
        }
    }
    private fun showKeyboard() {
        val inputMethodManager: InputMethodManager =
            context.getSystemService(Context.INPUT_METHOD_SERVICE) as InputMethodManager
        inputMethodManager.showSoftInput(editText, 0)
    }

    private fun hideKeyboard() {
        val inputMethodManager =
            context.getSystemService(Context.INPUT_METHOD_SERVICE) as InputMethodManager
        inputMethodManager.hideSoftInputFromWindow(editText.windowToken, 0)
    }


    override fun dispose() {
    }
}