import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/home/news/data/models/news.dart';
import 'package:taleb/features/home/news/data/repositories/news_repository.dart';

part 'last_news_state.dart';

class LastNewsCubit extends Cubit<LastNewsState> {
  final NewsRepository _repository;

  LastNewsCubit(this._repository) : super(LastNewsInitial());

  void lastNews() async {
    emit(LastNewsLoading());
    final Either<Failure, ListResponse<News>> response =
        await _repository.lastNews();
    response.fold(
      (Failure failure) => emit(LastOfferLoadFailure(failure.toMessage())),
      (ListResponse<News> response) {
        emit(
          response.data.isEmpty
              ? LastNewsEmptyData()
              : LastNewsLoadedSuccess(response.data),
        );
      },
    );
  }
}
