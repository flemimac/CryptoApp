// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:flutter_learn/repositories/crypto_coins/crypto_coins.dart';
import 'package:get_it/get_it.dart';
import '../widgets/widgets.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, required this.title});

  final String title;

  @override
  State<CryptoListScreen> createState() => _CryptoListScreen();
}

class _CryptoListScreen extends State<CryptoListScreen> {
  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Crypto Currenciest List'),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            final completer = Completer();
            _cryptoListBloc.add(LoadCryptoList(completer: completer));
            return completer.future;
          },
          child: BlocBuilder<CryptoListBloc, CryptoListState>(
            bloc: _cryptoListBloc,
            builder: (context, state) {
              if (state is CryptoListLoaded) {
                return ListView.separated(
                  padding: EdgeInsets.only(top: 16),
                  itemCount: state.coinsList.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, i) {
                    final coin = state.coinsList[i];
                    return CryptoCoinTile(coin: coin);
                  },
                );
              }
              if (state is CryptoListLoadingFailure) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Something went wrong',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 24),
                      ),
                      Text(
                        'Please try againg later',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                      const SizedBox(height: 30),
                      TextButton(
                          onPressed: () {
                            _cryptoListBloc.add(LoadCryptoList());
                          },
                          child: const Text('Try againg'))
                    ],
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}
