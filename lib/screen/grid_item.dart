import 'package:flutter/material.dart';
import '../contast.dart';

class GridListItem extends StatelessWidget {
  const GridListItem(
      {super.key,
      this.aspectRactio = 0.5,
      this.spacing = 0.0,
      required this.itemCount,
      required this.itemBuilder});
  final int itemCount;
  final double spacing;
  final double aspectRactio;
  final IndexedWidgetBuilder itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        primary: false,
        shrinkWrap: false,
        padding: const EdgeInsets.only(top: cardBarHeight),
        itemCount: itemCount,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: aspectRactio,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing),
        itemBuilder: itemBuilder);
  }
}
