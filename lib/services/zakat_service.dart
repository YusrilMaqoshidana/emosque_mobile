part of 'services.dart';

class ZakatService {
  Future<Zakat> createZakat (Zakat newZakat, String token) async {
    final url = Uri.parse('${ApiHelper.baseUrl}/zakat-fitrah');
    try{
      final response = await http.post(
        url,
        headers: ApiHelper.getHeaders(token),
        body: jsonEncode(newZakat)
      );
      final responseData = ApiHelper.handleResponse(response);
      final newZakatData = Zakat.fromJson(responseData['data']);
      return newZakatData;
    }catch(e){
      return ApiHelper.handleError(e);
    }
  }

  Future<Zakat> getAllZakat (String token) async {
    final url = Uri.parse('${ApiHelper.baseUrl}/zakat-fitrah');
    try{
      final response = await http.post(
        url,
        headers: ApiHelper.getHeaders(token),
      );
      final responseData = ApiHelper.handleResponse(response);
      final allZakatData = Zakat.fromJson(responseData['data']);
      return allZakatData;
    }catch(e){
      return ApiHelper.handleError(e);
    }
  }

  Future<Zakat> getZakatById (int idZakat, String token) async {
    final url = Uri.parse('${ApiHelper.baseUrl}/zakat-fitrah/$idZakat');
    try{
      final response = await http.post(
        url,
        headers: ApiHelper.getHeaders(token),
      );
      final responseData = ApiHelper.handleResponse(response);
      final zakatData = Zakat.fromJson(responseData['data']);
      return zakatData;
    }catch(e){
      return ApiHelper.handleError(e);
    }
  }
}