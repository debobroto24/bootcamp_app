import 'package:bootcamp_app/controller/blog/favorite_blog_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controller/blog/blogs_list_controller.dart';
import '../../controller/blog/favorites_list_controller.dart';
import '../../controller/blog/state/blog_state.dart';
import 'components/blog_card.dart';
import 'create_update_blog_screen.dart';
import 'favorites_blog_details.dart';
import 'package:bootcamp_app/model/blog_model.dart';

class FavoritesScreen extends ConsumerStatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends ConsumerState<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    final blogsListState = ref.watch(favoritesBlogListProvider);
    final blogsList = blogsListState is FavoriteBlogSuccessState
        ? blogsListState.favoritesList
        : [];

    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: blogsListState is FavoriteBlogSuccessState
          ? ListView.builder(
              itemCount: blogsList.length,
              itemBuilder: (BuildContext context, int index) {
                return FabBlogDetailsScreen(blogModel: blogsList[index]);
              },
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
