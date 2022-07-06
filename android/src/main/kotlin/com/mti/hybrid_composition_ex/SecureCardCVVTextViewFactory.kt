package io.weavr.weavr_components

import android.content.Context
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class SecureCardCVVTextViewFactory(messenger: BinaryMessenger) :
    PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    var messenger : BinaryMessenger? = messenger;

    public override fun create(context: Context?, viewId: Int, args: Any?): PlatformView {
        return FlutterSecureCardCVVTextView(context!!,viewId, messenger!!, args);
    }
}