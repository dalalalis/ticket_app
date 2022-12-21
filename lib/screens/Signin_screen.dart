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
      appBar: AppBar(
        backgroundColor: Colors.white12,
        centerTitle: true,
        title: Text("Signin Page"),
      ),
      body: SafeArea(
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
                    if (value != passwordController) {
                      return "Passwords Does Not Match";
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        var signed = await context.read<AuthProvider>().login(
                            username: usernameController.text,
                            password: passwordController
                                .text); // calling the provider

                        if (signed == null) {
                          context.pop();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("You did not signin ")));
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(),
                    child: Text("Signin")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
