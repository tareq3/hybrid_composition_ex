import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hybrid_composition_ex/hybrid_composition_ex_method_channel.dart';

void main() {
  MethodChannelHybridCompositionEx platform = MethodChannelHybridCompositionEx();
  const MethodChannel channel = MethodChannel('hybrid_composition_ex');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
