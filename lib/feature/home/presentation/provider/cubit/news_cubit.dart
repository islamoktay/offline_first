import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:offline_first/core/usecase/i_usecase.dart';
import 'package:offline_first/feature/home/domain/entity/article.dart';
import 'package:offline_first/feature/home/domain/usecase/get_news_from_local_db_usecase.dart';
import 'package:offline_first/feature/home/domain/usecase/get_news_from_network_usecase.dart';
import 'package:offline_first/feature/home/domain/usecase/save_news_to_local_db_usecase.dart';
import 'package:offline_first/feature/home/domain/usecase/watch_news_from_local_db_usecase.dart';

part 'news_state.dart';
part 'news_cubit.freezed.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(
    this._getNewsFromNetworkUsecase,
    this._watchNewsFromLocalDBUsecase,
    this._saveNewsToLocalDBUsecase,
    this._getNewsFromLocalDBUsecase,
  ) : super(const NewsState.loading());

  final GetNewsFromNetworkUsecase _getNewsFromNetworkUsecase;
  final WatchNewsFromLocalDBUsecase _watchNewsFromLocalDBUsecase;
  final SaveNewsToLocalDBUsecase _saveNewsToLocalDBUsecase;
  final GetNewsFromLocalDBUsecase _getNewsFromLocalDBUsecase;

  Future<void> newsFlow() async {
    await getLocalData();
    initWatchLocalData();
    await getNetworkData();
  }

  Future<void> getLocalData() async {
    try {
      emit(const NewsState.loading());
      final data = await _getNewsFromLocalDBUsecase(const NoParams());
      emit(NewsState.loaded(data));
    } catch (e) {
      emit(NewsState.error(e.toString()));
    }
  }

  Future<void> getNetworkData() async {
    try {
      final data = await _getNewsFromNetworkUsecase(const NoParams());
      await _saveNewsToLocalDBUsecase(data);
    } catch (_) {
      return;
    }
  }

  void initWatchLocalData() => _watchNewsFromLocalDBUsecase.call(emitLocalData);

  void emitLocalData(List<Article> data) => emit(NewsState.loaded(data));
}
