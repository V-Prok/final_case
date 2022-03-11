import 'package:final_case_2/screens/auth_screen.dart';
import 'package:final_case_2/screens/navigation.dart';
import 'package:final_case_2/screens/task_screen.dart';
import 'package:final_case_2/screens/userex_screen.dart';
import 'package:final_case_2/screens/users_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


void main() {
  runApp(MainScreen());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Users list',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Список пользователей'),
        ),
        drawer: navDrawer(context),
        body: Center(
            child: UsersListScreen()
        ),
      ),
    );
  }
}

Widget navDrawer(context) => Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
          child: Container (
            height: 0,
            child: Text ('Финальный проект'),
          ),),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text ('На главную '),
          onTap: (){Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const FirstRoute()),
          );},
        ),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text ('Список пользователей '),
          onTap: (){Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const SecondRoute()),
          );},

        ),
        ListTile(
          leading: const Icon(Icons.info_outline),
          title: const Text ('Информация о пользователе '),
          onTap: (){Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const FourthRoute()),
          );},
        ),
        ListTile(
          leading: const Icon(Icons.task),
          title: const Text ('Задачи '),
          onTap: (){Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ThirdRoute()),
          );},
        ),


      ],
    )
);