import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

import '../../styles/style.dart';

class MakeShimmer extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const MakeShimmer({
    super.key,
    required this.child,
    this.isLoading = true,
  }) ;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Shimmer.fromColors(
            baseColor: Style.bottomNavigationBarColor,
            highlightColor: Style.shimmerHighlight,
            child: child,
          )
        : child;
  }
}
