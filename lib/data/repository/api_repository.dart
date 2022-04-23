import '../network/api_client.dart';
import '../sharedpref/shared_preference_helper.dart';

class ApiRepository {
  final ApiService apiService;
  final SharedPreferencesHelper preferencesHelper;

  ApiRepository({required this.apiService, required this.preferencesHelper});


}
