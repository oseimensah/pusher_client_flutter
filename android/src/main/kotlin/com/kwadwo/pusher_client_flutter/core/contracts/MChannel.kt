package com.kwadwo.pusher_client_flutter.core.contracts

import androidx.annotation.NonNull
import io.flutter.plugin.common.BinaryMessenger

interface MChannel {
    fun register (@NonNull messenger: BinaryMessenger)
}