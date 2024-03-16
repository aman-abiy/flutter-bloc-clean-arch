import 'package:flutter_bloc_clean_arch/domain/entities/News.dart';

abstract class NewsState {}

class NewsInitial extends NewsState{}

class NewsIsLoading extends NewsState{}

class NewsSuccess extends NewsState{
  final List<News> newsList;
  
  NewsSuccess(this.newsList);
}

class NewsEmpty extends NewsState{}