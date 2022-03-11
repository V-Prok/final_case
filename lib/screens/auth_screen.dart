import 'package:final_case_2/main.dart';
import 'package:final_case_2/screens/task_screen.dart';
import 'package:final_case_2/screens/userex_screen.dart';
import 'package:final_case_2/screens/users_list_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            home: FirstRoute(),
    );
  }
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(36)),
        borderSide: BorderSide(
            color: const Color(0xFFbbbbbb), width: 2));
    const linkTextStyle = TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(0xFF0079D0)
    );
    return Scaffold(

        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(height: 100,),
              const SizedBox(width: 110,
                height: 84,
                child: Image(image: AssetImage('assets/600x600wa.png')),),
              SizedBox(height: 20,),
              Text('Введите логин в виде 10 цифр номера телефона',
                style: TextStyle(
                    fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.6)),),
              SizedBox(height: 20,),
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFeceff1),
                  enabledBorder: borderStyle,
                  focusedBorder: borderStyle,
                  labelText: 'Телефон',
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFeceff1),
                  enabledBorder: borderStyle,
                  focusedBorder: borderStyle,
                  labelText: 'Пароль',
                ),
              ),
              SizedBox(height: 28,),
              SizedBox(width: 154, height: 42, child:
              ElevatedButton(
                child: const Text('Войти'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SecondRoute()),
                  );
                },
                style: ElevatedButton.styleFrom(
                primary: Color(0xFF0079D0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(36.0),
                ),
              ),
              )
              ),
            ],),
          ),
        )
    );

  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список пользователей'),
      ),
      drawer: navDrawer(context),
      body: Center(child: UsersListScreen(),
        //  ElevatedButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   child: const Text('Go back!'),
        // ),
      ),
    );
  }
}

class ThirdRoute extends StatelessWidget {
  const ThirdRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список задач'),
      ),
      drawer: navDrawer(context),
      body:
      Column(children: [Center(child: TaskScreen()),
      ]),
      );
  }
}

class FourthRoute extends StatelessWidget {
  const FourthRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Информация о пользователе'),
      ),
      drawer: navDrawer(context),
      body: Center(child: UserExScreen(),
      ),
    );
  }
}
