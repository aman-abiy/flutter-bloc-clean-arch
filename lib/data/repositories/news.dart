import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_clean_arch/common/failure.dart';
import 'package:flutter_bloc_clean_arch/data/data_source/news.dart';
import 'package:flutter_bloc_clean_arch/data/utils/async_handler.dart';
import 'package:flutter_bloc_clean_arch/domain/entities/News.dart';
import 'package:flutter_bloc_clean_arch/domain/interfaces/News.dart';

class NewsRepositoryImpl extends NewsRepository {
  NewsDataSource newsDataSource;

  NewsRepositoryImpl(this.newsDataSource);

  @override
  FutureOr<Either<Failure, List<News>>> getNews() {

    return execute(() async {
        return (await newsDataSource.getNewsList()).map((e) => News.fromMap(e.toMap()));
    });
  }

}