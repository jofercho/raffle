import 'package:raffle/common/theme.dart';
import 'package:raffle/model/raflle_tabs_providers/raffle_tabs.dart';
import 'package:raffle/model/user_model.dart';
import 'package:raffle/model/validation/auth_validation.dart';
import 'package:raffle/util/navigation.dart';
import 'package:raffle/views/authentication/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raffle/views/authentication/sign_in.dart';
import 'package:raffle/views/authentication/sign_up.dart';

void main(List<String> args) {
  runApp(const MyChat());
}

class MyChat extends StatefulWidget {
  const MyChat({Key? key}) : super(key: key);

  @override
  State<MyChat> createState() => _MyChatState();
}

class _MyChatState extends State<MyChat> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserModel>(
            create: (context) => UserModel.empty()),
        ChangeNotifierProvider<AuthenticationValidation>(
            create: (context) => AuthenticationValidation()),
        ChangeNotifierProvider<RaffleTabsNavigation>(
            create: (context) => RaffleTabsNavigation())
      ],
      child: MaterialApp(
        title: 'MyChat',
        theme: appTheme,
        // home: Authenticate(),
        initialRoute: Navigation.authenticate,
        routes: {
          Navigation.authenticate: (context) => const Authenticate(),
          Navigation.signIn: (context) => const SignIn(),
          Navigation.signUp: (context) => const SignUp()
        },
      ),
    );
  }
}
