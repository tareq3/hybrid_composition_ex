import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

typedef void TextViewCreatedCallback(
    SecureCardCVVTextViewController controller);

class SecureCardCVVTextView extends StatefulWidget {
  const SecureCardCVVTextView({
    Key? key,
    this.onTextViewCreated,
    this.textSize,
    this.textColor = Colors.black87,
  }) : super(key: key);

  final TextViewCreatedCallback? onTextViewCreated;
  final int? textSize;
  final Color? textColor;
  @override
  State<StatefulWidget> createState() => _SecureCardCVVTextViewState();
}

class _SecureCardCVVTextViewState extends State<SecureCardCVVTextView> {
  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return PlatformViewLink(
        surfaceFactory:
            (BuildContext context, PlatformViewController controller) {
          return AndroidViewSurface(
            controller: controller as AndroidViewController,
            gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
            hitTestBehavior: PlatformViewHitTestBehavior.opaque,
          );
        },
        onCreatePlatformView: (PlatformViewCreationParams params) {
          return PlatformViewsService.initSurfaceAndroidView(
              id: params.id,
              viewType: 'hybrid_composition_ex/secure_card_cvv_text_view',
              layoutDirection: TextDirection.ltr,
              creationParams: <String, dynamic>{
                'text_size': widget.textSize,
                'text_color': int.parse(widget.textColor!.value.toString())
              },
              creationParamsCodec: const StandardMessageCodec(),
              onFocus: () {
                params.onFocusChanged(true); // <-- Fix
              })
            ..addOnPlatformViewCreatedListener((id) {
              params.onPlatformViewCreated(id);
              _onPlatformViewCreated(id);
            })
            ..create();
        },
        viewType: 'weavr_components/secure_card_pin_edit_text',
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
          viewType: 'hybrid_composition_ex/secure_card_cvv_text_view',
          onPlatformViewCreated: _onPlatformViewCreated,
          creationParams: <String, dynamic>{
            'text_size': widget.textSize,
            'text_color': int.parse(widget.textColor!.value.toString())
          },
          creationParamsCodec: const StandardMessageCodec());
    } else {
      return Text('SecureTextView is only supported on Android & iOS.');
    }
  }

  void _onPlatformViewCreated(int id) {
    if (widget.onTextViewCreated == null) {
      return;
    }
    widget.onTextViewCreated!(SecureCardCVVTextViewController._(id));
  }
}

class SecureCardCVVTextViewController {
  SecureCardCVVTextViewController._(int id)
      : _channel = MethodChannel(
            'hybrid_composition_ex/secure_card_cvv_text_view_$id');
  final MethodChannel _channel;

  Future<String> setSecureText(String text) async {
    assert(text != null);
    var map = {"text": text};
    return await _channel.invokeMethod('setText', map);
  }

  Future<void> enableCopyTextToClipboardOnClick(bool isTrue) async {
    await _channel.invokeMethod('enableCopyTextToClipboardOnClick', isTrue);
  }

  Future<void> enableCopyTextToClipboardOnLongClick(bool isTrue) async {
    await _channel.invokeMethod('enableCopyTextToClipboardOnLongClick', isTrue);
  }
}
