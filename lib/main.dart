import 'package:raffle/common/theme.dart';
import 'package:raffle/model/add_raffle/add_raffle_model.dart';
import 'package:raffle/model/raflle_tabs_providers/raffle_tabs_model.dart';
import 'package:raffle/model/admin_model.dart';
import 'package:raffle/model/validation/add_raffle_validation.dart';
import 'package:raffle/model/validation/auth_validation.dart';
import 'package:raffle/services/user_service.dart';
import 'package:raffle/util/firebase_utils.dart';
import 'package:raffle/util/navigation.dart';
import 'package:raffle/views/authentication/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raffle/views/authentication/sign_in.dart';
import 'package:raffle/views/authentication/sign_up.dart';
import 'package:raffle/views/add_raffle/add_raffle.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseUtils firebaseUtils = FirebaseUtils();
  await firebaseUtils.initialize();
  runApp(const MyChat());
}

class MyChat extends StatefulWidget {
  const MyChat({Key? key}) : super(key: key);

  @override
  State<MyChat> createState() => _MyChatState();
}

class _MyChatState extends State<MyChat> {
  var auth = AuthenticationValidation();
  var admin = AdminModel();

  @override
  void initState() {
    super.initState();
    fakeStart();
  }

  fakeStart() {
    print(' este es el initstate de main');
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      print('despues del build');
      auth.test();
      setState(() {
        admin.isAuthenticaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AdminModel>(create: (context) => admin),
        ChangeNotifierProvider<AuthenticationValidation>(
            create: (context) => auth),
        ChangeNotifierProvider<AddRaffleValidation>(
            create: (context) => AddRaffleValidation()),
        ChangeNotifierProvider<RaffleTabsNavigationModel>(
            create: (context) => RaffleTabsNavigationModel()),
        ChangeNotifierProvider<AddRaffleModel>(
            create: (context) => AddRaffleModel()),
        ChangeNotifierProvider<UserService>(create: (context) => UserService())
      ],
      child: MaterialApp(
        title: 'MyChat',
        theme: appTheme,
        // home: Authenticate(),
        initialRoute: Navigation.authenticate,
        routes: {
          Navigation.authenticate: (context) => const Authenticate(),
          Navigation.signIn: (context) => const SignIn(),
          Navigation.signUp: (context) => const SignUp(),
          Navigation.addRaffle: (context) => const AddRaffle(),
        },
      ),
    );
  }
}
