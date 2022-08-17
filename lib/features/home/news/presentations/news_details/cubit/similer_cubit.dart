import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:one_studio_core/core.dart';
import 'package:taleb/features/home/news/data/models/news.dart';
import 'package:taleb/features/home/news/data/repositories/news_repository.dart';

part 'similer_state.dart';

class SimilerCubit extends Cubit<SimilerState> {
  final NewsRepository _newsRepository;

  SimilerCubit(this._newsRepository) : super(SimilerInitial());

  void similerNews(int newsId) async {
    emit(SimilerLoading());
    final Either<Failure, ListResponse<News>> response =
        await _newsRepository.similerNews(newsId);
    response.fold(
      (Failure failure) => emit(SimilerLoadFailure(failure.toMessage())),
      (ListResponse<News> response) {
        emit(SimilerLoadedSuccess(response.data));
      },
    );
  }
}
