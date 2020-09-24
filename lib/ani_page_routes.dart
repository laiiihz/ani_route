import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef Router = Route Function(BuildContext context, Widget page);

class APageRoutes {
  static get isIOS => Platform.isIOS;
  static Route defaultRoute(BuildContext context, Widget child) {
    return isIOS
        ? CupertinoPageRoute(builder: (context) => child)
        : MaterialPageRoute(builder: (context) => child);
  }

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
