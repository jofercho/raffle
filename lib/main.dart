import 'package:raffle/common/theme.dart';
import 'package:raffle/model/user_model.dart';
import 'package:raffle/views/authentication/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MyChat());
}

class MyChat extends StatefulWidget {
  MyChat({Key? key}) : super(key: key);

  @override
  State<MyChat> createState() => _MyChatState();
}

class _MyChatState extends State<MyChat> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserModel>(
          create: (context) => UserModel.empty()
        )
      ],
      child: MaterialApp(
        title: 'MyChat',
        theme: appTheme,
        // home: Authenticate(),
        initialRoute: '/',
        routes: {
          '/' :(context) => const Authenticate(),
        },
      ),
    );
  }
}
