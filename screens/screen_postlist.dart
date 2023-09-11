import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/checkboxlist_viewmodel.dart';

class PostListPage extends StatefulWidget {
  @override
  _PostListPageState createState() => _PostListPageState();
}

class _PostListPageState extends State<PostListPage> {
  @override
  void initState() {
    super.initState();
    // Load the list of posts when the page loads
    Provider.of<PostViewModel>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final postViewModel = Provider.of<PostViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: Consumer<PostViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.posts.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: viewModel.posts.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(viewModel.posts[index]['title']),
                  subtitle: Text(viewModel.posts[index]['body']),
                  trailing: Checkbox(
                    value: viewModel.posts[index]['checked'] ?? false,
                    onChanged: (bool? newValue) {
                      viewModel.toggleCheckbox(index, newValue);
                    },
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final checkedPosts = postViewModel.getCheckedPosts();
          print(checkedPosts);
        },
        child: Icon(Icons.check),
      ),
    );
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => PostViewModel(),
      child: MaterialApp(
        home: PostListPage(),
      ),
    ),
  );
}
