import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'info_device_method_channel.dart';

abstract class InfoDevicePlatform extends PlatformInterface {
  /// Constructs a InfoDevicePlatform.
  InfoDevicePlatform() : super(token: _token);

  static final Object _token = Object();

  static InfoDevicePlatform _instance = MethodChannelInfoDevice();

  /// The default instance of [InfoDevicePlatform] to use.
  ///
  /// Defaults to [MethodChannelInfoDevice].
  static InfoDevicePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [InfoDevicePlatform] when
  /// they register themselves.
  static set instance(InfoDevicePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<Map?> getDeviceInfos() {
    throw UnimplementedError('deu erro, foi mal');
  }
}
