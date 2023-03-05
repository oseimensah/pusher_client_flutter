import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'pusher_client_flutter_platform_interface.dart';

/// An implementation of [PusherClientFlutterPlatform] that uses method channels.
class MethodChannelPusherClientFlutter extends PusherClientFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('pusher_client_flutter');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
