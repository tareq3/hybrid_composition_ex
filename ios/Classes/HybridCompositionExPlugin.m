#import "HybridCompositionExPlugin.h"
#if __has_include(<hybrid_composition_ex/hybrid_composition_ex-Swift.h>)
#import <hybrid_composition_ex/hybrid_composition_ex-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "hybrid_composition_ex-Swift.h"
#endif

@implementation HybridCompositionExPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftHybridCompositionExPlugin registerWithRegistrar:registrar];
}
@end
