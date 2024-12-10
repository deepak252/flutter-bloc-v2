import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Stack(
        children: [
          ModalBarrier(
            color: Colors.black.withOpacity(0.4),
            dismissible: false,
          ),
          const Center(
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  }
}


class LoaderManager {
  static OverlayEntry? _loaderEntry;

  static void showLoader(BuildContext context) {
    if (_loaderEntry == null) {
      _loaderEntry = OverlayEntry(
        builder: (context) => const Positioned.fill(
          child: Loader(),
        ),
      );
      Overlay.of(context).insert(_loaderEntry!);
    }
  }

  static void hideLoader() {
    _loaderEntry?.remove();
    _loaderEntry = null;
  }
}
