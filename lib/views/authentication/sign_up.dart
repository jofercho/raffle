import 'package:raffle/model/app_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLoading = context.watch<AppModel>().isLoading;

    return Scaffold(
        appBar: AppBar(title: const Text('Chat')),
        body: isLoading
            ? const CircularProgressIndicator()
            : SingleChildScrollView(
                child: Container(),
              ));
  }
}
