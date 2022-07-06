import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hybrid_composition_ex/SecureCardPinEditText.dart';

class SecondActivity extends StatefulWidget {
  const SecondActivity({Key? key}) : super(key: key);

  @override
  State<SecondActivity> createState() => _SecondActivityState();
}

class _SecondActivityState extends State<SecondActivity> {
  final passWordTextStream = StreamController<String>();
  final passCodeTextStream = StreamController<String>();
  final cardPinTextStream = StreamController<String>();
  bool renderingComplete = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Components Together'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
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
            const SizedBox(
              height: 20,
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
            const SizedBox(
              height: 20,
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
            const SizedBox(
              height: 20,
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
            const SizedBox(
              height: 20,
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
            const SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/bank_card.png"),
                  fit: BoxFit.fitWidth,
                ),
              ), /* add child content here */
            ),
            const SizedBox(
              height: 20,
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
            const SizedBox(
              height: 20,
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
            const SizedBox(
              height: 20,
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
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
