import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'info_device_platform_interface.dart';

/// An implementation of [InfoDevicePlatform] that uses method channels.
class MethodChannelInfoDevice extends InfoDevicePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('info_device');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<Map?> getDeviceInfos() async {
    final version = await methodChannel.invokeMethod<Map>('getDeviceInfos')??{};
    return version;
  }
}
