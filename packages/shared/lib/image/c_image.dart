import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CImageView extends StatelessWidget {
  const CImageView({
    this.url,
    this.size = const Size(60, 60),
    this.radius = 6,
    this.borderRadius,
    this.fit = BoxFit.fill,
    this.filterQuality = FilterQuality.low,
    this.progressIndicatorBuilder,
    this.errorBuilder,
    this.emptyWidget,
    super.key,
  });

  final String? url;

  /// Default [Size(60, 60)]
  final Size size;

  /// Default [6]
  final double radius;
  final BorderRadiusGeometry? borderRadius;

  /// Default [BoxFit.cover]
  final BoxFit fit;

  /// Default [FilterQuality.low]
  final FilterQuality filterQuality;
  final Widget Function(BuildContext, String, DownloadProgress)?
  progressIndicatorBuilder;
  final Widget Function(BuildContext, String, Object)? errorBuilder;
  final Widget? emptyWidget;

  @override
  Widget build(BuildContext context) {
    Widget wd = const SizedBox.shrink();

    if (url == null || url!.length < 10) {
      wd = emptyWidget ?? wd;
    } else {
      wd = CachedNetworkImage(
        imageUrl: url!,
        fit: fit,
        filterQuality: filterQuality,
        progressIndicatorBuilder:
            progressIndicatorBuilder ??
            (context, url, progress) {
              return CircularProgressIndicator();
            },
        errorWidget:
            errorBuilder ??
            (context, url, error) {
              return emptyWidget ?? wd;
            },
      );
    }

    return ClipRRect(
      borderRadius: borderRadius ?? .circular(radius),
      child: SizedBox(width: size.width, height: size.height, child: wd),
    );
  }
}
