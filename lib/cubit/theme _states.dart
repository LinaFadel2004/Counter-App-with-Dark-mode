abstract class ThemeStates {
  final bool isDark;
  ThemeStates(this.isDark);
}

class ThemeInit extends ThemeStates{
  ThemeInit() : super(false);
}

class ThemeUpdate extends ThemeStates{
  ThemeUpdate(super.isDark);
}