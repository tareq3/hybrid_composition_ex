import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

typedef void SecureCardPinEditTextCreatedCallback(
    SecureCardPinEditTextController controller);

class SecureCardPinEditText extends StatefulWidget {
  SecureCardPinEditText(
      {Key? key,
      this.textColor,
      this.height,
      this.textSize,
      this.background = false,
      this.placeholder,
      this.placeholderColor,
      this.onTextViewCreated,
      this.hintColor,
      this.enableDone = true})
      : super(key: key);

  final SecureCardPinEditTextCreatedCallback? onTextViewCreated;
  Color? textColor;
  Color? placeholderColor;
  int? id;
  final String? placeholder;
  final int? height;
  Color? hintColor;
  final double? textSize;
  final bool? background;
  final bool? enableDone;

  @override
  State<StatefulWidget> createState() => _SecureCardPinEditTextState();
}

class _SecureCardPinEditTextState extends State<SecureCardPinEditText> {
  final Completer<MethodChannel> _channel = Completer();

  Map<String, dynamic> _buildCreationParams(BoxConstraints constraints) {
    Map<String, dynamic> creationParams = {};

    creationParams.addAll({
      "enableDone": widget.enableDone,
    });

    creationParams.addAll({
      "width": constraints.maxWidth.toDouble(),
    });

    ///whatever you want to run on page build
    if (widget.textColor != null) {
      creationParams.addAll({
        "color": defaultTargetPlatform == TargetPlatform.iOS
            ? int.parse(widget.textColor!.toHex())
            : int.parse(widget.textColor!.value.toString())
      });
    }

    if (widget.height != null) {
      creationParams.addAll({
        "height": widget.height?.toDouble(),
      });
    } else {
      creationParams.addAll({
        "height": constraints.maxHeight.toDouble(),
      });
    }

    if (widget.background != null) {
      creationParams.addAll({"background": widget.background});
    }

    if (widget.textSize != null) {
      creationParams.addAll({
        "textSize": widget.textSize,
      });
    }
    if (widget.placeholder != null) {
      creationParams.addAll({
        "placeholder": widget.placeholder,
      });
    }
    if (widget.placeholderColor != null) {
      creationParams.addAll({
        "placeholderColor": defaultTargetPlatform == TargetPlatform.iOS
            ? int.parse(widget.placeholderColor!.toHex())
            : int.parse(widget.placeholderColor!.value.toString())
      });
    }
    if (widget.hintColor != null) {
      creationParams.addAll({
        "hintColor": defaultTargetPlatform == TargetPlatform.iOS
            ? int.parse(widget.hintColor!.toHex())
            : int.parse(widget.hintColor!.value.toString())
      });
    }
    return creationParams;
  }

  @override
  void dispose() {
    _effectiveFocusNode.removeListener(_focusNodeListener);
    _focusNode?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _effectiveFocusNode.addListener(_focusNodeListener);
  }

  void _inputStarted() {
    if (!_effectiveFocusNode.hasFocus) {
      FocusScope.of(context).requestFocus(_effectiveFocusNode);
    }
  }

  void _inputFinished(String? text) async {
    /*  if (widget.onEditingComplete != null) {
      widget.onEditingComplete!();
    } else */
    {
      final channel = await _channel.future;
      channel.invokeMethod("unfocus");
      if (_effectiveFocusNode.hasFocus) FocusScope.of(context).unfocus();
    }
    /*if (widget.onSubmitted != null) {
      await Future.delayed(const Duration(milliseconds: 100));
      widget.onSubmitted!(text);
    }*/
  }

  Future<void> _focusNodeListener() async {
    final MethodChannel channel = await _channel.future;
    if (mounted) {
      channel.invokeMethod(_effectiveFocusNode.hasFocus ? "focus" : "unfocus");
    }
  }

  bool showOverlay = true;
  FocusNode? _focusNode;

  FocusNode get _effectiveFocusNode => (_focusNode ??= FocusNode());

  /* @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return StreamBuilder<bool>(
          stream: visibleStream.stream,
          builder: (context, snapshot) {
            return Stack(
              children: [
                AndroidView(
                    viewType: 'weavr_components/secure_card_pin_edit_text',
                    onPlatformViewCreated: _onPlatformViewCreated,
                    creationParams: creationParams,
                    creationParamsCodec: const StandardMessageCodec()),
                Visibility(
                    visible: snapshot.data == true,
                    child: Container(
                      color: Colors.white,
                    ))
              ],
            );
          });
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
          viewType: 'weavr_components/secure_card_pin_edit_text',
          onPlatformViewCreated: _onPlatformViewCreated,
          creationParams: creationParams,
          creationParamsCodec: const StandardMessageCodec());
    } else {
      return const Text('SecureEditText is only supported on Android & iOS.');
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 1,
        maxHeight: 20,
      ),
      child: LayoutBuilder(
        builder: (context, layout) => Container(
          // decoration: const BoxDecoration(color: Colors.transparent),
          child: _platformView(layout),
        ),
      ),
    );
  }

  Widget _platformView(BoxConstraints layout) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      /* return AndroidView(
          key: widget.key,
          viewType: 'weavr_components/secure_edit_text',
          onPlatformViewCreated: _onPlatformViewCreated,
          creationParams: creationParams,
          creationParamsCodec: const StandardMessageCodec());*/

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
              viewType: 'hybrid_composition_ex/secure_card_pin_edit_text',
              layoutDirection: TextDirection.ltr,
              creationParams: _buildCreationParams(layout),
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
        viewType: 'hybrid_composition_ex/secure_card_pin_edit_text',
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
          viewType: 'hybrid_composition_ex/secure_card_pin_edit_text',
          onPlatformViewCreated: _onPlatformViewCreated,
          creationParams: _buildCreationParams(layout),
          creationParamsCodec: const StandardMessageCodec());
    } else {
      return Text('SecureEditText is only supported on Android & iOS');
    }
  }

  void _onPlatformViewCreated(int id) async {
    if (widget.onTextViewCreated == null) {
      return;
    }

    widget.id = id;
    var secureCardPinEditTextController = SecureCardPinEditTextController._(id);
    widget.onTextViewCreated!(secureCardPinEditTextController);
    secureCardPinEditTextController._channel
        .setMethodCallHandler(_onMethodCall);
    _channel.complete(secureCardPinEditTextController._channel);
  }

  Future<bool?> _onMethodCall(MethodCall call) async {
    switch (call.method) {
      case "inputValueChanged":
        final String? text = call.arguments["text"];
        final int? lineIndex = call.arguments["currentLine"];
        //_inputValueChanged(text, lineIndex);
        return null;

      case "inputStarted":
        _inputStarted();
        return null;

      case "inputFinished":
        final String? text = call.arguments["text"];
        _inputFinished(text);
        return null;
    }

    throw MissingPluginException(
        "NativeTextInput._onMethodCall: No handler for ${call.method}");
  }
}

class SecureCardPinEditTextController {
  SecureCardPinEditTextController._(int id)
      : _channel =
            MethodChannel('weavr_components/secure_card_pin_edit_text_$id');

  final MethodChannel _channel;

  Future<String> createToken() async {
    return await _channel.invokeMethod('createToken');
  }
}

extension HexColor on Color {
  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) =>
      '${leadingHashSign ? '0x' : ''}'
      // '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
