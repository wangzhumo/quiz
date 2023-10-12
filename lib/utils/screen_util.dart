///
/// If you have any questions, you can contact by email {wangzhumoo@gmail.com}
/// @author ease 2020/4/20  11:08 AM
///
/// screen adapter utils
import 'package:flutter/material.dart';

///screen adapter
class SA {
  static const double default_w = 390;
  static const double default_h = 844;

  ///设置自己设计稿的屏幕尺寸
  ///单位 : px
  double ui_design_w = default_w.toDouble();
  double ui_design_h = default_h.toDouble();

  ///是否跟随系统字体大小
  bool allowSystemFontScale = true;

  ///实际屏幕宽度
  static double _screen_w = 0;

  ///实际屏幕高度
  static double _screen_h = 0;

  ///实际物理尺寸的比例
  static double _pixelRatio = 0;

  ///状态栏的高度
  static double _statusBar_h = 0;

  ///底部虚拟键的高度
  static double _bottomBar_h = 0;

  ///文字的缩放因子
  static double _textScaleFactor = 0;

  static final SA _instance = SA._internal();

  SA._internal();

  ///利用工厂方法达成单例
  factory SA() => _instance;

  ///
  /// 初始化这个工具类
  /// @param width 设计稿的宽度
  /// @param height 设计稿的高度
  ///
  static void init(BuildContext ctx,
      {double width = default_w,
      double height = default_h,
      bool allowSystemFontScale = false}) {
    ///设置到变量上去
    _instance.ui_design_w = width;
    _instance.ui_design_h = height;
    _instance.allowSystemFontScale = allowSystemFontScale;

    ///ctx可以获取当前设备的尺寸大小
    MediaQueryData mediaQueryData = MediaQuery.of(ctx);
    _screen_w = mediaQueryData.size.width;
    _screen_h = mediaQueryData.size.height;
    _pixelRatio = mediaQueryData.devicePixelRatio;
    _statusBar_h = mediaQueryData.padding.top;
    _bottomBar_h = mediaQueryData.padding.bottom;
    _textScaleFactor = mediaQueryData.textScaleFactor;
  }

  /// 实际的dp与UI设计px的比例
  double get scaleWidth => _screen_w / ui_design_w;

  double get scaleHeight => _screen_h / ui_design_h;

  double get scaleText => scaleWidth;

  ///------------根据传入的值,返回一个经过计算的值-------------
  // ignore: non_constant_identifier_names
  double Width(num width) {
    return width * scaleWidth;
  }

  // ignore: non_constant_identifier_names
  num Height(num height) {
    return height * scaleHeight;
  }

  ///字体的缩放.
  ///1.考虑系统缩放字体
  ///2.UI稿缩放
  ///allowSystemFontScale 与 allowFontScaleSelf的返回是一致的
  ///这里这是提供了一个覆盖掉全局scale的方法.
  double Sp(num fontSize, {bool? allowFontScaleSelf}) {
    if (allowFontScaleSelf == null) {
      return allowSystemFontScale
          ? (fontSize * scaleText)
          : ((fontSize * scaleText) / _textScaleFactor);
    } else {
      return allowFontScaleSelf
          ? (fontSize * scaleText)
          : ((fontSize * scaleText) / _textScaleFactor);
    }
  }
}
