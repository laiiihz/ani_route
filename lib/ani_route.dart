library ani_route;

export 'package:ani_route/ani_page_routes.dart';

import 'package:ani_route/ani_page_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

///Ani Route
///
///快速开发自定义路由
///
///使用前请调用 ARoute.init
///
class ARoute {
  ///初始化Route
  static init(bool isIOS) {
    APageRoutes.setPlatormIOS(isIOS);
  }

  ///same as `Navigator.push`
  ///
  /// default is `APageRoutes.defaultRoute`
  ///
  /// part of APageRoutes:
  ///
  /// fadeRoute
  static Future push(
    BuildContext context,
    Widget page, {
    ARouter route = APageRoutes.defaultRoute,
  }) async {
    await Navigator.push(context, route(context, page));
  }

  ///same as `Navigator.pushReplacement`
  ///
  static Future pushReplace(
    BuildContext context,
    Widget page, {
    ARouter route = APageRoutes.defaultRoute,
  }) async {
    await Navigator.pushReplacement(context, route(context, page));
  }

  ///Route pop
  ///
  ///`root` 路由到底
  ///
  ///`system` 关闭应用
  static pop(
    BuildContext context, {
    bool root = false,
    bool system = false,
  }) {
    if (system) {
      SystemNavigator.pop();
      return;
    }
    if (root) {
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
        pop(context);
      } else {
        return;
      }
    } else {
      Navigator.pop(context);
    }
  }
}
