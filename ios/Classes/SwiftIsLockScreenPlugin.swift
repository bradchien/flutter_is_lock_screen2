import Flutter
import UIKit

public class SwiftIsLockScreenPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "is_lock_screen", binaryMessenger: registrar.messenger())
        let instance = SwiftIsLockScreenPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch (call.method) {
        case "isLockScreen":
#if os(iOS)
            return result(UIScreen.main.brightness == 0.0)
#else
            return result(false)
#endif
        default:
            return result(FlutterMethodNotImplemented)
        }
    }
}
