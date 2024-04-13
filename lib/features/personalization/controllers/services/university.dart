import 'package:cover_page/utils/constants/image_strings.dart';

import '../../../../utils/constants/text_strings.dart';

class University {
  /// Get university logo
  String getUniversityLogo(String id) {
    switch (id) {
      case '1':
        return CImages.myUniversity;
      case '2':
        return CImages.buetLogo;
      case '3':
        return CImages.duLogo;
      case '4':
        return CImages.juLogo;
      case '5':
        return CImages.nsuLogo;
      case '6':
        return CImages.bupLogo;
      case '7':
        return CImages.aiubLogo;
      case '8':
        return CImages.bracLogo;
      case '9':
        return CImages.iubLogo;
      case '10':
        return CImages.ewuLogo;
      default:
        return CImages.diuLogo;
    }
  }

  /// Get short name of university
  String getUniversityShortName(String id) {
    switch (id) {
      case '1':
        return CTexts.diuShortName;
      case '2':
        return CTexts.buetShortName;
      case '3':
        return CTexts.duShortName;
      case '4':
        return CTexts.juShortName;
      case '5':
        return CTexts.nsuShortName;
      case '6':
        return CTexts.bupShortName;
      case '7':
        return CTexts.aiubShortName;
      case '8':
        return CTexts.bracShortName;
      case '9':
        return CTexts.iubShortName;
      case '10':
        return CTexts.ewuShortName;
      default:
        return '';
    }
  }

  /// Get full name of university
  String getUniversityFullName(String id) {
    switch (id) {
      case "1":
        return CTexts.diuFullName;
      case "2":
        return CTexts.buetFullName;
      case "3":
        return CTexts.duFullName;
      case "4":
        return CTexts.juFullName;
      case "5":
        return CTexts.nsuFullName;
      case "6":
        return CTexts.bupFullName;
      case "7":
        return CTexts.aiubFullName;
      case "8":
        return CTexts.bracFullName;
      case "9":
        return CTexts.iubFullName;
      case "10":
        return CTexts.ewuFullName;
      default:
        return "";
    }
  }

  /// Get university id
  int getUniversityId(String id) {
    switch (id) {
      case "1":
        return 0;
      case "2":
        return 1;
      case "3":
        return 2;
      case "4":
        return 3;
      case "5":
        return 4;
      case "6":
        return 5;
      case "7":
        return 6;
      case "8":
        return 7;
      case "9":
        return 8;
      case "10":
        return 9;
      default:
        return -1;
    }
  }

  int getCoverPageType(String cType) {
    switch (cType) {
      case "Assignment":
        return 0;
      case "Lab Report":
        return 1;
      default:
        return -1;
    }
  }
}
