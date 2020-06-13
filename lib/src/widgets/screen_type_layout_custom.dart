import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ScreenTypeLayoutCustom extends ScreenTypeLayout {
  ScreenTypeLayoutCustom({
    Widget mobile,
    Widget desktop,
    Widget tablet,
  }) : super(
          breakpoints: const ScreenBreakpoints(
            desktop: 1300,
            tablet: 600,
            watch: 300,
          ),
          mobile: mobile,
          desktop: desktop,
          tablet: tablet,
        );
}
