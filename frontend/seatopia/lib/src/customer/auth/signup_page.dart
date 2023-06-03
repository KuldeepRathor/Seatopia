import 'package:flutter/material.dart';
import 'package:frontend/providers/customer_providers.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/routes.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class CustomerSignUpPage extends StatefulWidget {
  const CustomerSignUpPage({super.key});

  @override
  State<CustomerSignUpPage> createState() => _CustomerSignUpPageState();
}

class _CustomerSignUpPageState extends State<CustomerSignUpPage> {
  String username = "", email = "", password = "", phone = "";

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("SignUp"),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Visibility(
                    visible: provider.isLoading,
                    child: LinearProgressIndicator()),
                const Spacer(),
                TextField(
                  decoration: const InputDecoration(
                    hintText: "Username",
                  ),
                  onChanged: (e) => username = e.trim(),
                ),
                TextField(
                  onChanged: (e) => email = e.trim(),
                  decoration: const InputDecoration(
                    hintText: "Email",
                  ),
                ),
                TextField(
                  onChanged: (e) => password = e.trim(),
                  decoration: const InputDecoration(
                    hintText: "Password",
                  ),
                ),
                TextField(
                  decoration: const InputDecoration(
                    hintText: "Phone",
                  ),
                  onChanged: (e) => phone = e.trim(),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    print(
                        "the values are email:$email\n username:$username\n password:$password\n phone:$phone");
                    await provider.signUpCustomer(
                      username: username,
                      email: email,
                      password: password,
                      phone: phone,
                      context: context,
                    );

                    // Navigator.pushNamedAndRemoveUntil(
                    //     context, Routes.customerHomeRoute, (route) => false);
                  },
                  child: const Text("Sign up"),
                ),
                const SizedBox(height: 40),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, Routes.customerLoginRoute);
                  },
                  child: const Text("Don't have an account? Login"),
                ),
                const Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
