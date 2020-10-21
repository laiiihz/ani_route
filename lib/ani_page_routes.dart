import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///ARouter
typedef ARouter = Route Function(BuildContext context, Widget page);

///APageRoutes 样式
class APageRoutes {
  static bool _isIOS = false;

  static setPlatormIOS(bool state) {
    _isIOS = state;
  }

  ///iOS
  static get isIOS => _isIOS;

  ///默认路由器
  static Route defaultRoute(BuildContext context, Widget child) {
    return isIOS
        ? CupertinoPageRoute(builder: (context) => child)
        : MaterialPageRoute(builder: (context) => child);
  }

  ///透明路由器
  static Route fadeRoute(BuildContext context, Widget child) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondAnimation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
