import 'package:flutter/material.dart';
import 'package:frontend/providers/customer_providers.dart';
import 'package:frontend/routes.dart';
import 'package:provider/provider.dart';

class CustomerLoginPage extends StatefulWidget {
  const CustomerLoginPage({super.key});

  @override
  State<CustomerLoginPage> createState() => _CustomerLoginPageState();
}

class _CustomerLoginPageState extends State<CustomerLoginPage> {
  String email = "", password = "";

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Login"),
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
                    hintText: "Email",
                  ),
                  onChanged: (e) => email = e.trim(),
                ),
                TextField(
                  decoration: const InputDecoration(
                    hintText: "Password",
                  ),
                  onChanged: (e) => password = e.trim(),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    await provider.loginCustomer(
                        email: email, password: password, context: context);
                  },
                  child: const Text("Login"),
                ),
                const SizedBox(height: 40),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(Routes.customerSignUpRoute);
                  },
                  child: const Text("Don't have an account? Sign Up"),
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
