import 'package:flutter/material.dart';
import 'package:frontend/providers/customer_providers.dart';
import 'package:frontend/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<CustomerProvider>(
          create: (_) => CustomerProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Seatopia',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        fontFamily: GoogleFonts.inter().fontFamily,
        useMaterial3: true,
      ),
      onGenerateRoute: Routes.getRoutes,
    );
  }
}
