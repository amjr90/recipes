import 'network_repository.dart';

class NetworkService {
  final NetworkRepository repository;

  NetworkService(this.repository);

  Future<dynamic> getResponse(String url) {
    return repository.getResponse(url);
  }
}
