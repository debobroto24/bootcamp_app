import 'package:bootcamp_app/controller/base/base_state.dart';
import 'package:bootcamp_app/controller/blog/state/blog_state.dart';
import 'package:bootcamp_app/model/blog_model.dart';
import 'package:bootcamp_app/model/favorite_blog.dart';
import 'package:bootcamp_app/network/endpoints.dart';
import 'package:bootcamp_app/network/network_utils.dart';
import 'package:riverpod/riverpod.dart';

final favoritesBlogListProvider =
    StateNotifierProvider<FavoriteBlogsListController, BaseState>(
  (ref) => FavoriteBlogsListController(ref: ref),
);

class FavoriteBlogsListController extends StateNotifier<BaseState> {
  final Ref? ref;
  FavoriteBlogsListController({this.ref}) : super(const InitialState());

  List<Favorites> favoritesblogsList = [];

  Future fetchBlogsList() async {
    state = const LoadingState();
    dynamic responseBody;

    try {
      responseBody = await Network.handleResponse(
          await Network.getRequest(API.getFavotiteblogs));
      if (responseBody != null) {
        favoritesblogsList = (responseBody['data'] as List<dynamic>)
            .map((x) => Favorites.fromJson(x))
            .toList();

        state = FavoriteBlogSuccessState(favoritesblogsList);
      } else {
        state = const ErrorState();
      }
    } catch (error, stackTrace) {
      print('fetchBlogsList() error = $error');
      print(stackTrace);
      state = const ErrorState();
    }
  }
}
