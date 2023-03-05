import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pusher_client_flutter/pusher_client_flutter_method_channel.dart';

void main() {
  MethodChannelPusherClientFlutter platform = MethodChannelPusherClientFlutter();
  const MethodChannel channel = MethodChannel('pusher_client_flutter');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
