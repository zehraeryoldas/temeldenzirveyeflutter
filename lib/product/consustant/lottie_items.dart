// ignore_for_file: non_constant_identifier_names

import 'dart:core';

enum LottieItems { themeChange }

extension LottieItemsExtension on LottieItems {
  String _path() {
    switch (this) {
      case LottieItems.themeChange:
        return 'lottie_theme_change';
    }
  }

  String get LottiePath => '../assets/lottie/${_path()}.json';
}
