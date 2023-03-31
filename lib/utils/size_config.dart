import 'package:flutter/material.dart';

class ScreenSize {
  MediaQueryData? _mediaQueryData;
  double? _screenWidth;
  double? _screenHeight;
  double? _blockSizeHorizontal;
  double? _blockSizeVertical;

  double? _safeAreaHorizontal;
  double? _safeAreaVertical;
  double? _safeBlockHorizontal;
  double? _safeBlockVertical;
  static double? horizontal;
  static double? vertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    _screenWidth = _mediaQueryData!.size.width;
    _screenHeight = _mediaQueryData!.size.height;
    _blockSizeHorizontal = _screenWidth! / 100;
    _blockSizeVertical = _screenHeight! / 100;

    _safeAreaHorizontal =
        _mediaQueryData!.padding.left + _mediaQueryData!.padding.right;
    _safeAreaVertical =
        _mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom;
    _safeBlockHorizontal = (_screenWidth! - _safeAreaHorizontal!) / 100;
    _safeBlockVertical = (_screenHeight! - _safeAreaVertical!) / 100;

    horizontal = _safeBlockHorizontal;
    vertical = _safeBlockVertical;
  }
}
