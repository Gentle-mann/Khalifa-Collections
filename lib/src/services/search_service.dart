import 'package:seed/src/models/products_model.dart';
import 'package:http/http.dart' as http;
import 'package:seed/src/services/config.dart';

class SearchService {
  var client = http.Client();
  Future<List<Products>> search(String searchQuery) async {
    var url = Uri.http(Config.apiUrl, '${Config.search}$searchQuery');
    var response = await client.get(url);
    if (response.statusCode == 200) {
      final searchResult = productsFromJson(response.body);
      return searchResult;
    } else {
      throw Exception('Failed to get searched products');
    }
  }
}
