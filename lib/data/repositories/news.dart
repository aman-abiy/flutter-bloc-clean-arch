import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_clean_arch/common/exception.dart';
import 'package:flutter_bloc_clean_arch/common/failure.dart';
import 'package:flutter_bloc_clean_arch/data/data_source/news.dart';
import 'package:flutter_bloc_clean_arch/data/utils/async_handler.dart';
import 'package:flutter_bloc_clean_arch/domain/entities/News.dart';
import 'package:flutter_bloc_clean_arch/domain/interfaces/news.dart';

class NewsRepositoryImpl extends NewsRepository {

  NewsRepositoryImpl(this.newsDataSource);

  final NewsDataSource newsDataSource;

  @override
  FutureOr<Either<Failure, List<News>>> getNews() async{ 
    try {
      final result = (await newsDataSource.getNewsList()).map((e) => News.fromMap(e.toMap())).toList();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('No internet connection'));
    }
  }

}


// return execute(() async {
//         return (await newsDataSource.getNewsList()).map((e) => News.fromMap(e.toMap()));
//     });
//   }
