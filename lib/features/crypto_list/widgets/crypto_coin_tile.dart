// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_learn/repositories/crypto_coins/models/crypto_coin.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coin,
  });

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Image.network(coin.imageURL),
      title: Text(
        coin.name,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text('${coin.priceInUSD.toStringAsFixed(4)}\$',
          style: theme.textTheme.labelSmall),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/coin',
          arguments: coin,
        );
      },
    );
  }
}
