package io.weavr.weavr_components

import android.content.Context
import android.util.AttributeSet
import android.view.View
import android.widget.EditText
import com.mti.hybrid_composition_ex.SecureCardPinEditText
import com.mti.hybrid_composition_ex.SecureEditText
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView

class FlutterSecureCardCVVTextView : PlatformView, MethodChannel.MethodCallHandler {

    val attrSet = object : AttributeSet{
        override fun getAttributeCount(): Int {
            return 0
        }

        override fun getAttributeName(p0: Int): String {
            return  ""
        }

        override fun getAttributeValue(p0: Int): String {
            return ""
        }

        override fun getAttributeValue(p0: String?, p1: String?): String {
            return ""
        }

        override fun getPositionDescription(): String {
            return  ""
        }

        override fun getAttributeNameResource(p0: Int): Int {
            return 0
        }

        override fun getAttributeListValue(
            p0: String?,
            p1: String?,
            p2: Array<out String>?,
            p3: Int
        ): Int {
            return 0
        }

        override fun getAttributeListValue(p0: Int, p1: Array<out String>?, p2: Int): Int {
            return 0
        }

        override fun getAttributeBooleanValue(p0: String?, p1: String?, p2: Boolean): Boolean {
            return false
        }

        override fun getAttributeBooleanValue(p0: Int, p1: Boolean): Boolean {
            return false
        }

        override fun getAttributeResourceValue(p0: String?, p1: String?, p2: Int): Int {
            return 0
        }

        override fun getAttributeResourceValue(p0: Int, p1: Int): Int {
            return 0
        }

        override fun getAttributeIntValue(p0: String?, p1: String?, p2: Int): Int {
            return 0
        }

        override fun getAttributeIntValue(p0: Int, p1: Int): Int {
            return 0
        }

        override fun getAttributeUnsignedIntValue(p0: String?, p1: String?, p2: Int): Int {
            return 0
        }

        override fun getAttributeUnsignedIntValue(p0: Int, p1: Int): Int {
            return 0
        }

        override fun getAttributeFloatValue(p0: String?, p1: String?, p2: Float): Float {
            return 0.0f
        }

        override fun getAttributeFloatValue(p0: Int, p1: Float): Float {
            return 0.0f
        }

        override fun getIdAttribute(): String {
            return ""
        }

        override fun getClassAttribute(): String {
            return ""
        }

        override fun getIdAttributeResourceValue(p0: Int): Int {
            return 0
        }

        override fun getStyleAttribute(): Int {
            return 0
        }
    }

    lateinit var textView: SecureCardPinEditText
    lateinit var methodChannel: MethodChannel

    constructor(context: Context, id: Int, messenger: BinaryMessenger, args: Any?) : super() {
        methodChannel =
            MethodChannel(messenger, "hybrid_composition_ex/secure_card_cvv_text_view_$id")
        methodChannel.setMethodCallHandler(this)
        val _args = args as Map<String, Any?>

        textView = SecureCardPinEditText(context, attrs = null)
        textView.initialize(context, attrs = null)


        textView.hint = "Enter Password"
        // textView.initialize(context, attrs = null)
        if (_args["text_size"] != null) {
            textView.textSize = (_args["text_size"] as Int).toFloat()
        } else {
            textView.textSize = 16f
        }

        if (_args["text_color"] != null) {
            textView.setTextColor((_args["text_color"] as Long).toInt())
        }
//        textView.setBackgroundColor(Color.rgb(255, 255, 255))
//        textView.text = "Rendered on a native Android view (id: $id)"
    }

    override fun getView(): SecureCardPinEditText? {
        return textView
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "setText" -> {
                setText(call, result)
            }
            "setTextColor" -> {
                textView.setTextColor(call.arguments as Int)
            }
            else -> {
                result.notImplemented()
            }
        }
    }

    private fun setText(methodCall: MethodCall, result: MethodChannel.Result) {
        val args = methodCall.arguments as Map<String, String>
//        textView.setHint(args["text"])
    }

    override fun dispose() {
    }
}