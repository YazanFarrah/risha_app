import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final Color? color;
  const Loader({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: color ?? Colors.white,
      ),
    );
  }
}


class LoadingOverlay extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const LoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Positioned.fill(
            child: Stack(
              children: [
                // Blur effect (optional)
                Container(
                  color: Colors.black.withOpacity(0.5), // Overlay color with opacity
                  child: const Center(
                    child: CircularProgressIndicator(), // Loading indicator
                  ),
                ),
                // Uncomment below if you want a blur effect (requires flutter_blurhash package)
                // BlurHash(
                //   hash: 'LEHV6nWB9YUn5pD4s;0t5xX6fRkD6X6Q0', // Example hash, replace with your own
                //   imageFit: BoxFit.cover,
                // ),
              ],
            ),
          ),
      ],
    );
  }
}
