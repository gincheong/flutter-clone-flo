// * MM:SS:ss 형태의 문자열을 파싱해서, 밀리초 단위의 int로 반환함
import 'package:flutter/material.dart';

int getTotalMsecFromTimestamp(String timestamp) {
  int min = int.parse(timestamp.substring(0, 2));
  int sec = int.parse(timestamp.substring(3, 5));
  int msec = int.parse(timestamp.substring(6, 9));

  return (min * 60 * 1000) + (sec * 1000) + msec;
}

double getStatusBarHeight(BuildContext context) {
  return MediaQuery.of(context).padding.top;
}
