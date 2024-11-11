// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter/material.dart';
import 'package:flutter_learn/crypto_coins_list_app.dart';
import 'package:flutter_learn/repositories/crypto_coins/crypto_coins.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() {
  final talker = Talker();
  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().debug("Talker started...");

  final dio = Dio();
  dio.interceptors.add(
    TalkerDioLogger(talker: talker),
  );

  Bloc.observer = TalkerBlocObserver(talker: talker);

  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
      () => CryptoCoinsRepository(dio: dio));

  FlutterError.onError =
      (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

  runZonedGuarded(() => CryptoCurrenciesListApp(),
      (e, st) => GetIt.I<Talker>().handle(e, st));
}
