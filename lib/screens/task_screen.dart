import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Post> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Post.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  const Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}


class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  late Future<Post> futurePost;
  bool _checked = false;
  @override
  void initState() {
    super.initState();
    futurePost = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
          child: FutureBuilder<Post>(
            future: futurePost,
            builder: (context, snapshot) {
              if (snapshot.hasData) {

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Row(
                    children: [
                      Checkbox(value: _checked, onChanged: (val) {
                        setState(() {
                          _checked = !_checked;
                        });
                      }),
                      Text(
                        snapshot.data!.title,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  ),

                    //SizedBox(height: 100),
                    //Text(snapshot.data!.completed,
                    //style: Theme.of(context).textTheme.headline6),
                  ],
                );

              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            })
          );
         }
}