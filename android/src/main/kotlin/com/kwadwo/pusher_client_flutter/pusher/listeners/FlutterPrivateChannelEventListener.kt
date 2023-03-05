package com.kwadwo.pusher_client_flutter.pusher.listeners

import com.kwadwo.pusher_client_flutter.core.utils.Constants
import com.kwadwo.pusher_client_flutter.pusher.PusherService
import com.kwadwo.pusher_client_flutter.pusher.PusherService.Companion.enableLogging
import com.kwadwo.pusher_client_flutter.pusher.PusherService.Companion.errorLog
import com.pusher.client.channel.PrivateChannelEventListener
import com.pusher.client.channel.PusherEvent
import java.lang.Exception

class FlutterPrivateChannelEventListener: FlutterBaseChannelEventListener(), PrivateChannelEventListener {
    companion object {
        val instance = FlutterPrivateChannelEventListener()
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
        PusherService.debugLog("[PRIVATE] Subscribed: $channelName")
    }
}