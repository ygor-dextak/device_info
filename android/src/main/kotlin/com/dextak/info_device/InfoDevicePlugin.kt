package com.dextak.info_device

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** InfoDevicePlugin */
class InfoDevicePlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "info_device")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    }
    else if(call.method == "getDeviceInfos"){
      val mapa = mapOf(
        "ID" to android.os.Build.ID,
        "DEVICE" to android.os.Build.DEVICE,
        "USER" to android.os.Build.USER,
        "TYPE" to android.os.Build.TYPE,
        "PRODUCT" to android.os.Build.PRODUCT,
        "MODEL" to android.os.Build.MODEL,
        "MANUFACTURER" to android.os.Build.MANUFACTURER,
        "FINGERPRINT" to android.os.Build.FINGERPRINT,
        "DISPLAY" to android.os.Build.DISPLAY,
        "BRAND" to android.os.Build.BRAND,
        "BOOTLOADER" to android.os.Build.BOOTLOADER,
        "HARDWARE" to android.os.Build.HARDWARE,
      )

      result.success(mapa)
    }
    else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
