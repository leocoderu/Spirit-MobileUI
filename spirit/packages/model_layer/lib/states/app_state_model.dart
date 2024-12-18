import 'package:hive/hive.dart';

enum switchState {on, wait, off}
enum colorTheme  {light, dark, system, red, blue, green, yellow, magenta, cyan, violette, braun}

@HiveType(typeId: 1)
class AppStateModel {

  @HiveField(0)
  final switchState? local_auth;
  @HiveField(1)
  final switchState? auto_login;
  @HiveField(2)
  final colorTheme?  color_theme;

  AppStateModel({this.local_auth, this.auto_login, this.color_theme});

  AppStateModel copyWith({
    switchState? local_auth,
    switchState? auto_login,
    colorTheme? color_theme,
  }) {
    return AppStateModel(
      local_auth: local_auth,
      auto_login: auto_login,
      color_theme: color_theme,
    );
  }

  @override
  String toString() =>
    'AppState(local_auth: $local_auth, auto_login: $auto_login, color_theme: $color_theme)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppStateModel
        && other.local_auth == local_auth
        && other.auto_login == auto_login
        && other.color_theme == color_theme;
        //&& other.text == text;
  }

  @override
  int get hashCode => local_auth.hashCode ^ auto_login.hashCode ^ color_theme.hashCode; // ^ text.hashCode;
}