import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'hybrid_composition_ex_method_channel.dart';

abstract class HybridCompositionExPlatform extends PlatformInterface {
  /// Constructs a HybridCompositionExPlatform.
  HybridCompositionExPlatform() : super(token: _token);

  static final Object _token = Object();

  static HybridCompositionExPlatform _instance = MethodChannelHybridCompositionEx();

  /// The default instance of [HybridCompositionExPlatform] to use.
  ///
  /// Defaults to [MethodChannelHybridCompositionEx].
  static HybridCompositionExPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [HybridCompositionExPlatform] when
  /// they register themselves.
  static set instance(HybridCompositionExPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
