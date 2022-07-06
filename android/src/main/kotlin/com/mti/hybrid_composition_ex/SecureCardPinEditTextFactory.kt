package com.mti.hybrid_composition_ex

import android.content.Context
import android.os.Build
import androidx.annotation.RequiresApi
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory



class SecureCardPinEditTextFactory(messenger: BinaryMessenger) :
    PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    var messenger : BinaryMessenger? = messenger;

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    public override fun create(context: Context?, viewId: Int, args: Any?): PlatformView {
        val editText = FlutterSecureCardPinEditText(context!!,viewId, messenger!!, args);
        return editText
    }
}