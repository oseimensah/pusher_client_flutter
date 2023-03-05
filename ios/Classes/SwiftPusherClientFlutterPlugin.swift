import Flutter
import UIKit

// public class SwiftPusherClientFlutterPlugin: NSObject, FlutterPlugin {
//   public static func register(with registrar: FlutterPluginRegistrar) {
//     let channel = FlutterMethodChannel(name: "pusher_client_flutter", binaryMessenger: registrar.messenger())
//     let instance = SwiftPusherClientFlutterPlugin()
//     registrar.addMethodCallDelegate(instance, channel: channel)
//   }

//   public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
//     result("iOS " + UIDevice.current.systemVersion)
//   }
// }

public class SwiftPusherClientFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    PusherService().register(messenger: registrar.messenger())
  }
}
