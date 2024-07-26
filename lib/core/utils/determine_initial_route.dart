import 'package:cinemate/core/constants/app_keys.dart';
import 'package:cinemate/core/constants/app_routes.dart';
import 'package:cinemate/core/services/service_locator.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<String> determineInitialRoute() async {
  final token = await sl<FlutterSecureStorage>().read(key: AppKeys.kToken);
  return (token != null && token.isNotEmpty)
      ? AppRoutes.rootPageRoute
      : AppRoutes.authPageRoute;
}
