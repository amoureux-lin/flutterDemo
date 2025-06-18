import 'DioClient.dart';

class ApiService {
  final _client = DioClient();

  Future<List<String>> fetchHomeData() async {
    final response = await _client.get('/home/list');
    return List<String>.from(response.data ?? []);
  }

  Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await _client.post('/auth/login', data: {
      'username': username,
      'password': password,
    });
    return response.data;
  }
}
