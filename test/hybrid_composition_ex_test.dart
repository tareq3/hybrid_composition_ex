import 'package:flutter_test/flutter_test.dart';
import 'package:hybrid_composition_ex/hybrid_composition_ex.dart';
import 'package:hybrid_composition_ex/hybrid_composition_ex_platform_interface.dart';
import 'package:hybrid_composition_ex/hybrid_composition_ex_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockHybridCompositionExPlatform 
    with MockPlatformInterfaceMixin
    implements HybridCompositionExPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final HybridCompositionExPlatform initialPlatform = HybridCompositionExPlatform.instance;

  test('$MethodChannelHybridCompositionEx is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelHybridCompositionEx>());
  });

  test('getPlatformVersion', () async {
    HybridCompositionEx hybridCompositionExPlugin = HybridCompositionEx();
    MockHybridCompositionExPlatform fakePlatform = MockHybridCompositionExPlatform();
    HybridCompositionExPlatform.instance = fakePlatform;
  
    expect(await hybridCompositionExPlugin.getPlatformVersion(), '42');
  });
}
