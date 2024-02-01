import 'package:api_mock/core/models/post_item.dart';
import 'package:api_mock/repository/api_repository.dart';
import 'package:bloc/bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._apiRepository) : super(HomeLoadingState());

  final ApiRepository _apiRepository;

  Future<void> onInit() async {
    try {
      emit(HomeLoadingState());
      final result = await _getPosts();
      emit(HomeSuccessState(posts: result));
    } catch (exception) {
      emit(HomeErrorState(error: exception.toString()));
    }
  }

  Future<List<PostItem>> _getPosts() async => _apiRepository.getAllPosts();

  Future<void> onRefresh() async {
    try {
      emit(HomeLoadingState());
      final result = await _getPosts();
      emit(HomeSuccessState(posts: result));
    } catch (exception) {
      emit(HomeErrorState(error: exception.toString()));
    }
  }

  Future<void> delete(String id) async {
    try {
      emit(HomeLoadingState());
      await _apiRepository.delete(id);
      final result = await _getPosts();
      emit(HomeSuccessState(posts: result));
    } catch (exception) {
      emit(HomeErrorState(posts: state.posts, error: exception.toString()));
    }
  }
}
