abstract class ThemeStates {
  final bool isDark;
  ThemeStates(this.isDark);
}

class ThemeInit extends ThemeStates{
  ThemeInit(bool isDark) : super(isDark);
}

class ThemeUpdate extends ThemeStates{
  ThemeUpdate(super.isDark);
}