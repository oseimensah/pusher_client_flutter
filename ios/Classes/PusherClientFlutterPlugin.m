#import "PusherClientFlutterPlugin.h"
#if __has_include(<pusher_client_flutter/pusher_client_flutter-Swift.h>)
#import <pusher_client_flutter/pusher_client_flutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "pusher_client_flutter-Swift.h"
#endif

@implementation PusherClientFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPusherClientFlutterPlugin registerWithRegistrar:registrar];
}
@end
