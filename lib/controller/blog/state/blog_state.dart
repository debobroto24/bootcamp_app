import 'package:bootcamp_app/controller/base/base_state.dart';
import 'package:bootcamp_app/model/blog_model.dart';
import 'package:bootcamp_app/model/favorite_blog.dart';

class BlogsListSuccessState extends SuccessState {
  final List<BlogModel> blogsList;

  const BlogsListSuccessState(this.blogsList);
}

class BlogDetailsSuccessState extends SuccessState {
  final BlogModel blogModel;
  const BlogDetailsSuccessState(this.blogModel);
}

class BlogSuccessState extends SuccessState {
  const BlogSuccessState();
}

class FavoriteBlogSuccessState extends SuccessState {
  final List<Favorites> favoritesList;
  const FavoriteBlogSuccessState(this.favoritesList);
}
