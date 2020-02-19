import 'package:flutter/material.dart';

class DynamicSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double maxHeight;
  final double minHeight;

  const DynamicSliverHeaderDelegate({
    @required this.child,
    this.maxHeight = 250,
    this.minHeight = 80,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  // @override
  // bool shouldRebuild(DynamicSliverHeaderDelegate oldDelegate) => true;

  @override
  bool shouldRebuild(DynamicSliverHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;
}
