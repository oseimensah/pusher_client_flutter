// import 'pusher_client_flutter_platform_interface.dart';

// class PusherClientFlutter {
//   Future<String?> getPlatformVersion() {
//     return PusherClientFlutterPlatform.instance.getPlatformVersion();
//   }
// }

library pusher_client;

export 'src/pusher/channel.dart';
export 'src/pusher/pusher_auth.dart';
export 'src/pusher/pusher_options.dart';
export 'src/pusher/pusher_client.dart' show PusherClient;
export 'src/pusher/pusher_event.dart';
