package com.kwadwo.pusher_client_flutter.pusher.listeners

import com.kwadwo.pusher_client_flutter.core.utils.Constants
import com.kwadwo.pusher_client_flutter.pusher.PusherService
import com.kwadwo.pusher_client_flutter.pusher.PusherService.Companion.enableLogging
import com.kwadwo.pusher_client_flutter.pusher.PusherService.Companion.errorLog
import com.pusher.client.channel.PrivateEncryptedChannelEventListener
import com.pusher.client.channel.PusherEvent
import java.lang.Exception

class FlutterPrivateEncryptedChannelEventListener: FlutterBaseChannelEventListener(), PrivateEncryptedChannelEventListener {
    companion object {
        val instance = FlutterPrivateEncryptedChannelEventListener()
    }

    override fun onDecryptionFailure(event: String, reason: String) {
        errorLog("[PRIVATE-ENCRYPTED] Reason: $reason, Event: $event")
    }

    override fun onAuthenticationFailure(message: String, e: Exception) {
        errorLog(message)
        if(enableLogging) e.printStackTrace()
    }

    override fun onSubscriptionSucceeded(channelName: String) {
        this.onEvent(PusherEvent(mapOf(
                "event" to Constants.SUBSCRIPTION_SUCCEEDED.value,
                "channel" to channelName,
                "user_id" to null,
                "data" to null
        )))
        PusherService.debugLog("[PRIVATE-ENCRYPTED] Subscribed: $channelName")
    }
}