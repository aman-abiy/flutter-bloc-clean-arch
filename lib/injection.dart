import 'package:flutter_bloc_clean_arch/data/data_source/news.dart';
import 'package:flutter_bloc_clean_arch/data/repositories/news.dart';
import 'package:flutter_bloc_clean_arch/domain/interfaces/news.dart';
import 'package:flutter_bloc_clean_arch/domain/use_cases/news_service.dart';
import 'package:flutter_bloc_clean_arch/presentation/bloc/news/news_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;


void init() {
  //TODO: Data sources
  final newsDataSource = NewsDataSourceImpl();
  locator.registerLazySingleton<NewsDataSource>(
    () => newsDataSource,
  );

  // Repositories
  final newsRepository = NewsRepositoryImpl(locator());
  locator.registerLazySingleton<NewsRepository>(
    () => newsRepository,
  );

  // Use cases
  final signIn = NewsService(locator());
  locator.registerLazySingleton(
    () => signIn,
  );

  //TODO:  BLoCs
  final signInBloc = NewsBloc(locator<NewsService>());
  locator.registerLazySingleton(
    () => signInBloc,
  );
}
