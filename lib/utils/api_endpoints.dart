import 'package:shared_preferences/shared_preferences.dart';

class ApiEndPoints {
  static final String baseUrl = '203.101.97.94:81';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();

}

class _AuthEndPoints {
  final String registerEmail = 'authaccount/registration';
  final String loginEmail = 'mobapi/api/Report';

}
