import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coinName,
  });

  final String coinName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: SvgPicture.asset(
        'assets/svg/bitcoin-logo.svg', 
        height: 35,
        width: 35,
        color: Colors.orange,
        ),
      title: Text(
        coinName, 
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        '20000\$',
        style: theme.textTheme.labelSmall
      ),
      trailing: Icon(
        Icons.arrow_forward_ios, 
        color: Colors.white,
      ),
      onTap: (){
        Navigator.of(context).pushNamed(
          '/coin',
          arguments: coinName,
        );
      },
    );
  }
}