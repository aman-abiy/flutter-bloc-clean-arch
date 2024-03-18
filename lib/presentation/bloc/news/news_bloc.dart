import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_arch/common/exception.dart';
import 'package:flutter_bloc_clean_arch/domain/use_cases/news_service.dart';
import 'package:flutter_bloc_clean_arch/presentation/bloc/app/app_state.dart';
import 'package:flutter_bloc_clean_arch/presentation/bloc/error/error_states.dart';
import 'package:flutter_bloc_clean_arch/presentation/bloc/news/news_events.dart';
import 'package:flutter_bloc_clean_arch/presentation/bloc/news/news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsService _newsService;


  NewsBloc(this._newsService) : super(NewsInitial()) {

    on<TopNewsRequested>(_onFetchResource);
  }

  Future<void> _onFetchResource(TopNewsRequested event, Emitter<AppState> emit) async {
    emit(NewsIsLoading());
    
    try {
      final eitherResultOr = await _newsService.getNews();
      
      eitherResultOr.fold(
        (failure) {
          if (failure is NoConnectionException) {
            emit(ConnectivityErrorState(failure.message));
          } else if (failure is UnauthorizedException) {
            emit(UnauthorizedErrorState(failure.message));
          } else if (failure is TimeoutException) {
            emit(TimeoutErrorState(failure.message));
          } else {
            emit(GeneralErrorState(failure.message));
          }
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
      emit(GeneralErrorState(e.toString()));
    }
  }
}