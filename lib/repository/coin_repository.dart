import 'dart:convert';

import 'package:coinapp/models/data_model.dart';
import 'package:http/http.dart' as http;

class CoinRepository {
  Future<List<CryptoModel>?> getCoinData() async {
    String url =
        ("https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false");
    final response = await http.Client().get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Error occured');
    } else {
      Iterable models = jsonDecode(response.body);
      List<CryptoModel> crpytomodels = [];
      for (var model in models) {
        CryptoModel cryptomodel = CryptoModel.fromJson(model);
        crpytomodels.add(cryptomodel);
      }

      print(crpytomodels);
      return crpytomodels;
    }
  }
}
