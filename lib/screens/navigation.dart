import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle =
    TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);

    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Финальный проект'),
            actions: <Widget>[
              IconButton(onPressed: (){}, icon: const Icon(Icons.account_circle) ),
              IconButton(onPressed: (){}, icon: const Icon(Icons.backup_outlined) ),
              TextButton(onPressed: (){}, child: Text('Кнопка'),
                style: buttonStyle,),
            ],
          ),
          drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.teal,
                    ),
                    child: Container (
                      height: 50,
                      child: Text ('Drawer'),
                    ),),
                  ListTile(
                    leading: const Icon(Icons.add_circle_outline),
                    title: const Text ('Добавить '),
                    onTap: (){},
                  ),
                  ListTile(
                    leading: const Icon(Icons.cached_rounded),
                    title: const Text ('Обновить '),
                    onTap: (){},
                  ),
                  ListTile(
                    leading: const Icon(Icons.dangerous),
                    title: const Text ('Отмена '),
                    onTap: (){},
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text ('Настройки '),
                    onTap: (){},
                  ),
                ],
              )
          ),
          body: Center(child: Text ('Содеражание'),),
        )
    );
  }
}
