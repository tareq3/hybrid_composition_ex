
import 'hybrid_composition_ex_platform_interface.dart';

class HybridCompositionEx {
  Future<String?> getPlatformVersion() {
    return HybridCompositionExPlatform.instance.getPlatformVersion();
  }
}
