import 'package:dio/dio.dart';
import 'package:flutter_learn/repositories/crypto_coins/models/crypto_coin.dart';

class CryptoCoinsRepository {
  Future<List<CryptoCoin>> getCoinsList() async {
    final respone = await Dio().get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,AVAX,AID,DOV,CAG&tsyms=USD');

    final data = respone.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinList = dataRaw.entries.map((e) {
      final usdData =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final price = usdData['PRICE'];
      final imageURL = usdData['IMAGEURL'];
      return CryptoCoin(
        name: e.key,
        priceInUSD: price,
        imageURL: 'https://www.cryptocompare.com/$imageURL',
      );
    }).toList();
    return cryptoCoinList;
  }
}
