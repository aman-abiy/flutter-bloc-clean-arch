import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_clean_arch/common/failure.dart';
import 'package:flutter_bloc_clean_arch/domain/entities/News.dart';

abstract class NewsRepository {
  FutureOr<Either<Failure, List<News>>> getNews();
}