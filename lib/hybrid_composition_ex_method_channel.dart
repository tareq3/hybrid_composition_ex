import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'hybrid_composition_ex_platform_interface.dart';

/// An implementation of [HybridCompositionExPlatform] that uses method channels.
class MethodChannelHybridCompositionEx extends HybridCompositionExPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('hybrid_composition_ex');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
