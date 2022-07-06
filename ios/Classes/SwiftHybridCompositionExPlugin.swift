import Flutter
import UIKit

public class SwiftHybridCompositionExPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "hybrid_composition_ex", binaryMessenger: registrar.messenger())
    let instance = SwiftHybridCompositionExPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
