import 'dart:async';
import 'dart:convert';

import 'package:final_case_2/model/address.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<UserEx> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return UserEx.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}



class UserExScreen extends StatefulWidget {
  const UserExScreen({Key? key}) : super(key: key);

  @override
  _UserExScreenState createState() => _UserExScreenState();
}

class _UserExScreenState extends State<UserExScreen> {
  late Future<UserEx> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
                body: Center(
          child: FutureBuilder<UserEx>(
            future: futurePost,
            builder: (context, snapshot) {
              if (snapshot.hasData) {

                return Column(

                  children: [
                    Text(
                      snapshot.data!.name,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(height: 100),
                    Text(snapshot.data!.username,),
                    Text(snapshot.data!.email),
                    // Text(snapshot.data!.address),
                    // Text(snapshot.data!.street),
                    // Text(snapshot.data!.suite),
                    // Text(snapshot.data!.city),
                    // Text(snapshot.data!.zipcode),
                    Text(snapshot.data!.phone),
                    Text(snapshot.data!.website),


                  ],
                );

              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}