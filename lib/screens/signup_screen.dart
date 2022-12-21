import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:ticket_app/providers/authprovider.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white12,
        centerTitle: true,
        title: Text("Signup"),
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      hintText: "Username", labelText: "Username"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Required field";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: firstnameController,
                  decoration: InputDecoration(
                      hintText: "Firstname", labelText: "Firstname"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Required field";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: lastnameController,
                  decoration: InputDecoration(
                      hintText: "Lastname", labelText: "Lastname"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Required field";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      hintText: "Password", labelText: "Password"),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Required field";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                      hintText: "Confirm Password",
                      labelText: "Confirm Password"),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Required field";
                    }
                    if (value != passwordController.text) {
                      return "Passwords Does Not Match";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 150,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      var success = await context.read<AuthProvider>().signup(
                            username: usernameController.text,
                            password: passwordController.text,
                            first_name: firstnameController.text,
                            last_name: lastnameController.text,
                          );

                      if (success) {
                        context.pop();
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("error")));
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(),
                  child: Text("Signup"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
