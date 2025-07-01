import 'dart:ui';

class AppColors {
  static Color get primaryColor1 => const Color(0xff92A3FD);
  static Color get primaryColor2 => const Color(0xff9DCEFF);

  static Color get secondaryColor1 => const Color(0xffC58BF2);
  static Color get secondaryColor2 => const Color(0xffEEA4CE);

  static List<Color> get primaryButtonGradient => [
    const Color(0xffe3a59d),
    const Color(0xffe39f96),
  ];

  static List<Color> get roundedButtonGradient => [
    const Color(0xffB87CD2),
    const Color(0xffD0A6E6),
  ];

  static List<Color> get welcomeButtonGradient => [
    const Color(0xfff96d41),
    const Color(0xfffa521b),
  ];
  static List<Color> get secondaryGradient => [
    secondaryColor1,
    secondaryColor2,
  ];
  static List<Color> get bgGradient => [
    const Color(0xff003f5c),
    const Color(0xffFF6E40),
  ];

  static Color get black => const Color(0xff1D1617);
  static Color get lightBlack => const Color(0xff06070B);
  static Color get darkBlack => const Color(0xFF000000);
  static Color get white => const Color(0xffFFFFFF);
  static Color get eggWhite => const Color(0xfff8fbff);
  static Color get offWhite => const Color(0xffEFEFEF);
  static Color get darkGrey => const Color(0xff767676);
  static Color get grey => const Color(0xff786F72);
  static Color get lightGrey => const Color(0xffF7F8F8);
  static Color get lightGreyish => const Color(0xffFFFBFC);
  static Color get green => const Color(0xff367C2D);
  static Color get lightGreen => const Color(0xffA5EA75);
  static Color get purple => const Color(0xffB87CD2);
  static Color get lightPurple => const Color(0xffF4E0FF);
  static Color get blue => const Color(0xff0165DD);
  static Color get darkBlue => const Color(0xff42307D);
}
