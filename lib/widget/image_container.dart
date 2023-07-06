import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  ImageContainer({
    super.key,
    required this.width,
    required this.borderRadius,
    this.padding,
    this.margin,
    this.imageUrl,
    this.child,
    this.height,
  });

  final double width;
  final double? height;
  final double borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  String? imageUrl;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        image: DecorationImage(
          image: NetworkImage(imageUrl ?? 'https://i.pcmag.com/imagery/articles/00Cx7vFIetxCuKxQeqPf8mi-23.fit_lim.size_1600x900.v1643131202.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
