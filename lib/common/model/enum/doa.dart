import 'dart:core';

enum DoaEnum { pagiDanSore }

extension DoaExtension on DoaEnum {
  String get title {
    switch (this) {
      case DoaEnum.pagiDanSore:
        return 'Pagi dan Sore';
    }
  }

  String get file {
    switch (this) {
      case DoaEnum.pagiDanSore:
        return 'assets/doa/pagi_sore.json';
    }
  }
}
