import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ProdectApi {
  Future<String?> getProdect() async {
    var client = http.Client();
    try {
      Uri uri = Uri.parse(
          'https://issg.shopfast.net/api/v1/catalog/products/app-products');
      Response response = await client.get(uri);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return null;
      }
    } catch (e, s) {
      print(s);
      print(e);
      return null;
    }
  }
}
