import 'package:flutter_test/flutter_test.dart';
import 'package:info_device/info_device.dart';
import 'package:info_device/info_device_platform_interface.dart';
import 'package:info_device/info_device_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockInfoDevicePlatform
    with MockPlatformInterfaceMixin
    implements InfoDevicePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final InfoDevicePlatform initialPlatform = InfoDevicePlatform.instance;

  test('$MethodChannelInfoDevice is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelInfoDevice>());
  });

  test('getPlatformVersion', () async {
    InfoDevice infoDevicePlugin = InfoDevice();
    MockInfoDevicePlatform fakePlatform = MockInfoDevicePlatform();
    InfoDevicePlatform.instance = fakePlatform;

    expect(await infoDevicePlugin.getPlatformVersion(), '42');
  });
}
