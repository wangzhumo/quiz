import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:quiz/utils/text_utils.dart';

class FileManager {
  static Directory? _dirInMemory;

  static Future<Directory> get dir => _dir;

  static Future<Directory> get _dir async {
    if (_dirInMemory == null) {
      try {
        Directory dir;
        if (Platform.isIOS) {
          dir = await getApplicationDocumentsDirectory();
        } else {
          dir = await getExternalStorageDirectory() ??
              await getApplicationDocumentsDirectory();
        }
        _dirInMemory = dir;
        return dir;
      } catch (e) {
        rethrow;
      }
    } else {
      return Future.value(_dirInMemory);
    }
  }

  /// 应用 Cache 文件夹，推荐所以 Cache 放到此文件夹，此文件夹可被清除
  static Future<String> get _cacheDirPath {
    return _dir.then((value) {
      String v = value.path;
      if (!value.path.endsWith('/')) {
        // 没用以 / 结尾，手动添加
        v += '/';
      }
      v = '${v}cache';
      Directory directory = Directory(v);
      if (!directory.existsSync()) {
        // 如果没有存在,自己创建一个.
        directory.createSync(recursive: true);
      }
      return directory.path;
    });
  }

  /// 根据文件名创建一个缓存路径
  /// 参数 [path] 可以是文件名 或 文件夹名+文件名，如: /share/item0.png.
  static Future<String>? cacheFilePath(
      {required String dirPath, String? fileName}) {
    if (TextUtils.isEmpty(dirPath)) return null;
    String dir = dirPath;
    if (!dirPath.startsWith('/')) {
      // 没用以 / 开头，手动添加
      dir = '/$dirPath';
    }
    return _cacheDirPath.then((value) => value + dir).then((value) {
      Directory directory = new Directory(value);
      if (!directory.existsSync()) {
        // 如果没有存在,自己创建一个.
        directory.createSync(recursive: true);
      }

      String v = value;
      if (!dirPath.endsWith('/') && !TextUtils.isEmpty(fileName)) {
        // 没用以 / 结尾，手动添加
        v = '$v/';
      }
      if (TextUtils.isEmpty(fileName) || fileName == null) {
        return v;
      }
      return v + fileName;
    });
  }

  static Future cleanCache() async {
    final path = await _cacheDirPath;
    File(path).deleteSync(recursive: true);
    return true;
  }
}
