import 'package:flutter/material.dart';
import 'package:flutter_responsive/break_points.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveWidget({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  _getWidget(BoxConstraints dimensoes) {
    if (dimensoes.maxWidth < BreakPoints.mobile) {
      return mobile;
    }
    if (dimensoes.maxWidth >= BreakPoints.mobile &&
        dimensoes.maxWidth < BreakPoints.tablet) {
      return tablet;
    }
    if (dimensoes.maxWidth >= BreakPoints.tablet) {
      return desktop;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, dimensoes) {
      return AnimatedSwitcher(
        transitionBuilder: (child, animation) => ScaleTransition(
          child: child,
          scale: animation,
        ),
        duration: const Duration(seconds: 1),
        child: _getWidget(dimensoes),
      );
    });
  }
}
