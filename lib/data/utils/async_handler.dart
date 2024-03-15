import 'dart:io';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_clean_arch/common/exception.dart';
import 'package:flutter_bloc_clean_arch/common/failure.dart';

Future<Either<Failure, T>> execute<T>(Function() dataSourceCall) async {
  try {
    final result = dataSourceCall();
    return Right(result);
  } on ServerException catch (e) {
    return Left(ServerFailure(e.message));
  } on SocketException {
    return const Left(ConnectionFailure('No internet connection'));
  } on DioError catch (e) {
    return Left(ServerFailure(
      e.response?.data['message']?.toString() ?? 'Error occurred Please try again',
    ));
  }
}