import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'pusher_client_flutter_method_channel.dart';

abstract class PusherClientFlutterPlatform extends PlatformInterface {
  /// Constructs a PusherClientFlutterPlatform.
  PusherClientFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static PusherClientFlutterPlatform _instance = MethodChannelPusherClientFlutter();

  /// The default instance of [PusherClientFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelPusherClientFlutter].
  static PusherClientFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PusherClientFlutterPlatform] when
  /// they register themselves.
  static set instance(PusherClientFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
