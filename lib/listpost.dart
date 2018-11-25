import 'package:flutter/material.dart';
import 'post.dart';

class ListViewPosts extends StatelessWidget {

  final List<Post> posts;

  ListViewPosts({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      child: ListView.builder(
        itemCount: posts.length,
        padding: const EdgeInsets.all(8.0),
        itemBuilder: (context, position) {
          return Column(
            children: <Widget>[
              Divider(height: 5.0),
              ListTile(
                title: Text(
                  '${posts[position].title}',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.deepPurpleAccent
                  ),
                ),
                subtitle: Text(
                  '${posts[position].body}',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontStyle: FontStyle.italic
                  ),
                ),
                leading: Column(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      radius: 25.0,
                      child: Text(
                        'User ${posts[position].userId}',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white
                        ),
                    ),)
                  ],
                ),
                onTap: () => _onTapItem(context, posts[position]),
              )
            ],
          );
        },
      ),
    );

  }

  void _onTapItem (BuildContext context, Post post) {
    Scaffold.of(context).showSnackBar(new SnackBar(content: new Text(post.id.toString() + '  ' + post.title)));
  }

}