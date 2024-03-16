import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_arch/domain/use_cases/news_service.dart';
import 'package:flutter_bloc_clean_arch/presentation/bloc/news/news_events.dart';
import 'package:flutter_bloc_clean_arch/presentation/bloc/news/news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsService _newsService;


  NewsBloc(this._newsService) : super(NewsInitial()) {

    on<TopNewsRequested>(_onFetchResource);
  }

  Future<void> _onFetchResource(TopNewsRequested event, Emitter<NewsState> emit) async {
    emit(NewsIsLoading());
    
    try {
      final eitherResultOr = await _newsService.getNews();
      
      eitherResultOr.fold(
        (failure) {
          // Handle the failure case
          // if (failure is NoConnectionException) {
          //   emit(NoConnection());
          // } else if (failure is UnauthorizedException) {
          //   emit(Unauthorized());
          // } else if (failure is TimeoutException) {
          //   emit(Timeout());
          // } else {
          //   emit(Error(failure.toString()));
          // }
        },
        (data) {
          // Handle the success case
          if (data.isNotEmpty) {
            emit(NewsSuccess(data));
          } else {
            emit(NewsEmpty());
          }
        },
      );
    } catch (e) {
      emit(Error(e.toString()));
    }



}