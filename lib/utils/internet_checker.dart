import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<bool> isInternetAvailable() async {
  return await InternetConnectionChecker().hasConnection;
}
