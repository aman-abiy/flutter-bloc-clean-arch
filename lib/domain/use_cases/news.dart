import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_clean_arch/common/failure.dart';
import 'package:flutter_bloc_clean_arch/domain/interfaces/News.dart';

class News {
  final NewsRepository _newsRepository;

  News(this._newsRepository);

  FutureOr<Either<Failure, void>> getNews() async{
    return await _newsRepository.getNews();
  }
}