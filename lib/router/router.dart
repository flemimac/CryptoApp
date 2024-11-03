import 'package:flutter_learn/features/crypto_list/crypto_list.dart';
import 'package:flutter_learn/features/crypto_coin/crypto_coin.dart';

final routes = {
        '/' : (context) => const CryptoListScreen(title: ''),
        '/coin' : (context) => CryptoCoinScreen(),
      };