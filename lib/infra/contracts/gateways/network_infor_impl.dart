import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../../domain/contract/gateways/network_infor.dart';

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionCheckerPlus connectionChecker;

  NetworkInfoImpl(this.connectionChecker);
  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
