import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<bool> get isInternetAvailable async {
  return await InternetConnectionChecker().hasConnection;
}
