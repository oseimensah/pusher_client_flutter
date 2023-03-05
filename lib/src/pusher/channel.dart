import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:pusher_client_flutter/src/contracts/stream_handler.dart';
import 'package:pusher_client_flutter/src/models/event_stream_result.dart';
import 'package:pusher_client_flutter/src/pusher/pusher_event.dart';

class Channel extends StreamHandler {
  static const MethodChannel _mChannel =
      MethodChannel('com.github.chinloyal/pusher_client');
  static const classId = 'Channel';

  static final Map<String, void Function(PusherEvent?)> _eventCallbacks =
      <String, void Function(PusherEvent?)>{};

  final String name;

  Channel(this.name) {
    _subscribe();
  }

  void _subscribe() {
    _mChannel.invokeMethod('subscribe', {
      'channelName': name,
    });
  }

  /// Binds a callback ([onEvent]) to an event. The
  /// callback will be notified whenever the specified
  /// [eventName] is received on this channel.
  Future<void> bind(
    String eventName,
    void Function(PusherEvent? event) onEvent,
  ) async {
    registerListener(classId, _eventHandler);
    _eventCallbacks[name + eventName] = onEvent;

    await _mChannel.invokeMethod('bind', {
      'channelName': name,
      'eventName': eventName,
    });
  }

  /// Unbinds the callback from the given [eventName], in the scope
  /// of the channel being acted upon
  Future<void> unbind(String eventName) async {
    _eventCallbacks.remove(name + eventName);

    await _mChannel.invokeMethod('unbind', {
      'channelName': name,
      'eventName': eventName,
    });
  }

  /// Once subscribed it is possible to trigger client events on a private
  /// channel as long as client events have been activated for the a Pusher
  /// application. There are a number of restrictions enforced with client
  /// events. For full details see the
  /// [documentation](http://pusher.com/docs/client_events)
  ///
  /// The [eventName] to trigger must have a `client-` prefix.
  Future<void> trigger(String eventName, dynamic data) async {
    if (!eventName.startsWith('client-')) {
      eventName = "client-$eventName";
    }

    await _mChannel.invokeMethod(
      'trigger',
      jsonEncode({
        'eventName': eventName,
        'data': data.toString(),
        'channelName': name,
      }),
    );
  }

  Future<void> _eventHandler(event) async {
    var result = EventStreamResult.fromJson(jsonDecode(event.toString()));

    if (result.isPusherEvent) {
      var callback = _eventCallbacks[
          result.pusherEvent!.channelName! + result.pusherEvent!.eventName!];
      if (callback != null) {
        callback(result.pusherEvent);
      }
    }
  }
}
