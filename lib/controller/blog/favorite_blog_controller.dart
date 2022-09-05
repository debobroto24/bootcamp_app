import 'package:bootcamp_app/controller/base/base_state.dart';
import 'package:bootcamp_app/controller/blog/blog_details_controller.dart';
import 'package:bootcamp_app/controller/blog/blogs_list_controller.dart';
import 'package:bootcamp_app/controller/blog/state/blog_state.dart';
import 'package:bootcamp_app/model/blog_model.dart';
import 'package:bootcamp_app/model/favorite_blog.dart';
import 'package:bootcamp_app/network/endpoints.dart';
import 'package:bootcamp_app/network/network_utils.dart';
import 'package:riverpod/riverpod.dart';

import 'favorites_list_controller.dart';

final favoriteBlogProvider =
    StateNotifierProvider<FavoriteBlogController, BaseState>(
  (ref) => FavoriteBlogController(ref: ref),
);

class FavoriteBlogController extends StateNotifier<BaseState> {
  final Ref? ref;

  FavoriteBlogController({this.ref}) : super(const InitialState());

  Future createFavoriteBlog({id, is_favorite}) async {
    List<Favorites> favoritesList = [];
    state = const LoadingState();

    dynamic requestBody = {"id": id, "is_favorite": is_favorite};
    dynamic responseBody;

    try {
      responseBody = await Network.handleResponse(
        await Network.postRequest(API.favoriteBlog, requestBody),
      );
      if (responseBody != null) {
        // BlogModel createdBlog = BlogModel.fromJson(responseBody['student']);
        // print('createdBlog = $createdBlog');
        // List<BlogModel> blogsList =
        //     ref!.read(blogsListProvider.notifier).blogsList;
        // blogsList.add(createdBlog);

        ref!.read(favoritesBlogListProvider.notifier).state =
            FavoriteBlogSuccessState(favoritesList);
        print("responsebody: $responseBody");

        state = const BlogSuccessState();
      } else {
        state = const ErrorState();
      }
    } catch (error, stackTrace) {
      print('createBlog() error = $error');
      print(stackTrace);
      state = const ErrorState();
    }
  }
}
