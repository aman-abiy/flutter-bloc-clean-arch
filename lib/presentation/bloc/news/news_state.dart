import 'package:flutter_bloc_clean_arch/domain/entities/News.dart';
import 'package:flutter_bloc_clean_arch/presentation/bloc/app/app_state.dart';

abstract class NewsState extends AppState {}

class NewsInitial extends NewsState{}

class NewsIsLoading extends NewsState{}

class NewsSuccess extends NewsState{
  final List<News> newsList;
  
  NewsSuccess(this.newsList);
}

class NewsEmpty extends NewsState{}