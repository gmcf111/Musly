import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Shows the native iOS AirPlay route picker (AVRoutePickerView).
/// On non-iOS platforms this widget renders nothing.
class AirPlayButton extends StatelessWidget {
  final Color tintColor;
  final double size;

  const AirPlayButton({
    super.key,
    this.tintColor = Colors.white,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    if (!Platform.isIOS) return const SizedBox.shrink();

    // Convert Flutter Color to 0xAARRGGBB int for the native side.
    final colorInt = tintColor.toARGB32();

    return SizedBox(
      width: size + 16, // match IconButton tap target
      height: size + 16,
      child: UiKitView(
        viewType: 'musly/airplay_button',
        layoutDirection: TextDirection.ltr,
        creationParams: {'tintColor': colorInt},
        creationParamsCodec: const StandardMessageCodec(),
      ),
    );
  }
}
