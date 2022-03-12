import 'dart:ui';

const int baseWidth = 1170;
const int baseHeight = 2532;

var pixelRatio = window.devicePixelRatio;

// * logicalSize
var screenSize = window.physicalSize / pixelRatio;
var screenWidth = screenSize.width;
var screenHeight = screenSize.height;

double scale(num size) => (screenWidth / baseWidth) * size;
double verticalScale(num size) => (screenHeight / baseHeight) * size;
