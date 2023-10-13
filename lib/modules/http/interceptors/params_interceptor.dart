import 'dart:collection';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:device_info/device_info.dart' as device;
import 'package:package_info/package_info.dart' as package;

class ParamInterceptor extends InterceptorsWrapper {
  static String? _token;
  static Map<String, dynamic> deviceData = <String, dynamic>{};
  static Map<String, dynamic> packageData = <String, dynamic>{};
  static HashSet<String> whitelistSet = HashSet<String>();
  static final device.DeviceInfoPlugin _deviceInfoPlugin =
      device.DeviceInfoPlugin();
  ParamInterceptor() {
    /// white list , could't add auth header
    whitelistSet.add("sign_by_cell");
    whitelistSet.add("get_code");

    // load phone info
    _readPackageInfo();
    _readDeviceInfo(_deviceInfoPlugin);
  }

  Future<void> _readDeviceInfo(device.DeviceInfoPlugin deviceInfoPlugin) async {
    if (Platform.isAndroid) {
      deviceData = await deviceInfoPlugin.androidInfo.then((build) {
        return <String, dynamic>{
          'version.securityPatch': build.version.securityPatch,
          'version.sdkInt': build.version.sdkInt,
          'version.release': build.version.release,
          'version.previewSdkInt': build.version.previewSdkInt,
          'version.incremental': build.version.incremental,
          'version.codename': build.version.codename,
          'hardware': build.hardware,
          'host': build.host,
          'id': build.id,
          'manufacturer': build.manufacturer,
          'model': build.model,
          'tags': build.tags,
          'type': build.type,
          'isPhysicalDevice': build.isPhysicalDevice,
        };
      });
    } else if (Platform.isIOS) {
      deviceData = await deviceInfoPlugin.iosInfo.then((data) {
        return <String, dynamic>{
          'name': data.name,
          'systemName': data.systemName,
          'systemVersion': data.systemVersion,
          'model': data.model,
          'localizedModel': data.localizedModel,
          'isPhysicalDevice': data.isPhysicalDevice,
          'utsname.sysname:': data.utsname.sysname,
          'utsname.nodename:': data.utsname.nodename,
          'utsname.release:': data.utsname.release,
          'utsname.version:': data.utsname.version,
          'utsname.machine:': data.utsname.machine,
        };
      });
    } else {
      deviceData = <String, dynamic>{};
    }
  }

  Future<void> _readPackageInfo() {
    return package.PackageInfo.fromPlatform().then((value) {
      packageData = <String, String>{
        'appName': value.appName,
        'packageName': value.packageName,
        'version': value.version,
        'buildNumber': value.buildNumber,
      };
    });
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (deviceData.isEmpty) {
      await _readDeviceInfo(_deviceInfoPlugin);
    }

    /// add public params
    /// 1.token
    String path = options.uri.path;
    if (path.isNotEmpty) {
      String selectPath = whitelistSet
          .firstWhere((element) => (path.contains(element)), orElse: () => '');
      if (selectPath.isEmpty) {
        options.headers['Authorization'] = _token;
      }
    }

    /// 2.device
    if (deviceData.isNotEmpty) {
      if (Platform.isAndroid) {
        options.queryParameters
            .putIfAbsent('_osversion', () => deviceData['version.release']);
        options.queryParameters.putIfAbsent(
            '_isPhysicalDevice', () => deviceData['isPhysicalDevice']);
        options.queryParameters.putIfAbsent('_manufacturer',
            () => "${deviceData['manufacturer']} ${deviceData['model']}");
      } else if (Platform.isIOS) {
        options.queryParameters
            .putIfAbsent('_osversion', () => deviceData['systemVersion']);
        options.queryParameters.putIfAbsent(
            '_isPhysicalDevice', () => deviceData['isPhysicalDevice']);
      }
    }

    /// 3.package
    if (packageData.isNotEmpty) {
      options.queryParameters
          .putIfAbsent('_appversion', () => packageData['version']);
    }
    super.onRequest(options, handler);
  }

  ///Update Token
  void updateToken(String tokenStr) {
    _token = tokenStr;
  }
}
