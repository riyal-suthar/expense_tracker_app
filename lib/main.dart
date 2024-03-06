import 'package:expense_tracker_app/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/database_provider.dart';
import './screens/category_screen.dart';
import './screens/expense_screen.dart';
import './screens/all_expenses.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => DatabaseProvider()),
      ChangeNotifierProvider(create: (_) => ThemeService()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeService>(context).isTheme;
    return Consumer<ThemeService>(
      builder: (BuildContext context, ThemeService mode, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: mode.isTheme ? ThemeMode.light : ThemeMode.dark,
          initialRoute: CategoryScreen.name,
          routes: {
            CategoryScreen.name: (_) => const CategoryScreen(),
            ExpenseScreen.name: (_) => const ExpenseScreen(),
            AllExpenses.name: (_) => const AllExpenses(),
          },
        );
      },
    );
  }
}
