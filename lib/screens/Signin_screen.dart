import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:ticket_app/providers/authprovider.dart';

class Signin extends StatelessWidget {
  Signin({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white12,
      //   centerTitle: true,
      //   title: Text("Signin Page"),
      // ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Container(
                    height: 250,
                    width: 250,
                    child: Image.asset('lib/assets/logo.png')),
              ),
              Container(
                height: 300,
                width: 250,
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Username", hintText: "Username"),
                          controller: usernameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Required field";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Password", hintText: "password"),
                          obscureText: true,
                          controller: passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Required field";
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ElevatedButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  var signed =
                                      await context.read<AuthProvider>().login(
                                            username: usernameController.text,
                                            password: passwordController.text,
                                          ); // calling the provider

                                  if (signed == null) {
                                    context.go('/home');
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content:
                                                Text("You did not signin ")));
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(),
                              child: Text("Signin")),
                        ),
                        Text('If you dont have an account,'),
                        InkWell(
                          onTap: () {
                            context.push('/signup/');
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
