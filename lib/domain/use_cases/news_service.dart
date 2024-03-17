import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_clean_arch/common/failure.dart';
import 'package:flutter_bloc_clean_arch/domain/entities/News.dart';
import 'package:flutter_bloc_clean_arch/domain/interfaces/news.dart';

class NewsService {
  final NewsRepository _newsRepository;

  NewsService(this._newsRepository);

  FutureOr<Either<Failure, List<News>>> getNews() async{
    return await _newsRepository.getNews();
  }
}