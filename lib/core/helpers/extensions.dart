import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;

  // AppTypography get appTypography =>
  //     Theme.of(this).extension<AppTypography>() ?? AppTypography.initial;
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

extension ExtensionWidget on Widget {
  Widget get center => Align(alignment: Alignment.center, child: this);

  Widget withPadding({
    double all = 0.0,
    double vertical = 0.0,
    double horizontal = 0.0,
    double top = 0.0,
    double bottom = 0.0,
    double start = 0.0,
    double end = 0.0,
  }) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: (all + vertical + top),
        bottom: (all + vertical + bottom),
        start: (all + horizontal + start),
        end: (all + horizontal + start),
      ),
      child: this,
    );
  }

  Widget clipRRect({
    double? all,
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(all ?? topLeft ?? 0),
        topRight: Radius.circular(all ?? topRight ?? 0),
        bottomLeft: Radius.circular(all ?? bottomLeft ?? 0),
        bottomRight: Radius.circular(all ?? bottomRight ?? 0),
      ),
      child: this,
    );
  }

  Widget get toEnd =>
      Align(alignment: AlignmentDirectional.centerEnd, child: this);
  Widget get toStart =>
      Align(alignment: AlignmentDirectional.centerStart, child: this);
  Widget get toBottom => Align(alignment: Alignment.bottomCenter, child: this);
  Widget get toBottomEnd =>
      Align(alignment: AlignmentDirectional.bottomEnd, child: this);
  Widget get toBottomStart =>
      Align(alignment: AlignmentDirectional.bottomStart, child: this);
  Widget get toTopEnd =>
      Align(alignment: AlignmentDirectional.topEnd, child: this);
  Widget get toTopStart =>
      Align(alignment: AlignmentDirectional.topStart, child: this);
  Widget get toTop => Align(alignment: Alignment.topCenter, child: this);
}

extension WidgetExtension on Widget {
  Widget onTap({required void Function() function}) {
    return GestureDetector(onTap: function, child: this);
  }

  SliverToBoxAdapter get toSliver => SliverToBoxAdapter(child: this);

  Widget onTapShadow({
    required BorderRadius borderRadius,
    required void Function() function,
  }) {
    return InkWell(
      onTap: function,
      borderRadius: borderRadius,
      // splashColor: Colors.transparent,
      highlightColor: Colors.transparent,

      child: withPadding(all: 8),
    );
  }
}

// extension AsyncValueErrorMessage on AsyncValue<dynamic> {
//   String get errorMessage {
//     if (!hasError) return '';

//     if (error is Failure) {
//       return (error as Failure).message;
//     }

//     return error.toString();
//   }
// }
