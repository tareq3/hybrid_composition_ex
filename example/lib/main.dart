import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hybrid_composition_ex/SecureCardCVVTextView.dart';
import 'package:hybrid_composition_ex/SecureCardPinEditText.dart';
import 'package:hybrid_composition_ex/hybrid_composition_ex.dart';
import 'package:hybrid_composition_ex_example/second.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _hybridCompositionExPlugin = HybridCompositionEx();

  @override
  void initState() {
    super.initState();
    // initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _hybridCompositionExPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: body(platformVersion: _platformVersion),
      ),
    );
  }
}

class body extends StatefulWidget {
  const body({
    Key? key,
    required String platformVersion,
  })  : _platformVersion = platformVersion,
        super(key: key);

  final String _platformVersion;

  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body> {
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text('Running on: ${widget._platformVersion}\n'),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextField(
            controller: _textEditingController,
            decoration: const InputDecoration(
              labelText: 'Enter Email',
            ),
          ),
        ),
        SizedBox(
            height: 16,
            width: 200,
            child: SecureCardCVVTextView(
              textSize: 12,
              textColor: Colors.blue,
              onTextViewCreated: (controller) async {
                //todo: add card cvv here
                final res =
                    await controller.setSecureText("TNbT9c7K304BgIqH+0AACw==");
                print(res);
              },
            )),
        SizedBox(
          height: 16,
        ),
        SizedBox(
            height: 16,
            width: 200,
            child: SecureCardCVVTextView(
              textSize: 12,
              textColor: Colors.yellow,
              onTextViewCreated: (controller) async {
                //todo: add card cvv here
                final res =
                    await controller.setSecureText("TNbT9c7K304BgIqH+0AACw==");
                print(res);
              },
            )),
        SizedBox(
          height: 16,
        ),
        SizedBox(
            height: 16,
            width: 200,
            child: SecureCardCVVTextView(
              textSize: 12,
              textColor: Colors.pink,
              onTextViewCreated: (controller) async {
                //todo: add card cvv here
                final res =
                    await controller.setSecureText("TNbT9c7K304BgIqH+0AACw==");
                print(res);
              },
            )),
        SizedBox(
          height: 16,
        ),
        SizedBox(
            height: 16,
            width: 200,
            child: SecureCardCVVTextView(
              textSize: 12,
              textColor: Colors.orange,
              onTextViewCreated: (controller) async {
                //todo: add card cvv here
                final res =
                    await controller.setSecureText("TNbT9c7K304BgIqH+0AACw==");
                print(res);
              },
            )),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 46,
                      child: SecureCardPinEditText(
                        onTextViewCreated:
                            (SecureCardPinEditTextController controller) {
                          // _secureCardPinEditTextController = controller;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                    onPressed: () async {},
                    child: const Text('Try'),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        SizedBox(
            height: 16,
            width: 200,
            child: SecureCardCVVTextView(
              textSize: 12,
              textColor: Colors.blue,
              onTextViewCreated: (controller) async {
                //todo: add card cvv here
                final res =
                    await controller.setSecureText("TNbT9c7K304BgIqH+0AACw==");
                print(res);
              },
            )),
        ElevatedButton(
          child: const Text('Go Next'),
          onPressed: () {
            //go to secondActivity
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => const SecondActivity(),
              ),
            );
          },
        ),
      ],
    );
  }
}
