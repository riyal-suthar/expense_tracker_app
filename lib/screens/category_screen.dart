import 'package:expense_tracker_app/main.dart';
import 'package:expense_tracker_app/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './widgets/category_screen/category_fetcher.dart';
import './widgets/expense_form.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
  static const name = '/category_screen'; // for routes
  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<ThemeService>(context, listen: false).changeTheme();
              },
              icon: Icon(
                  Provider.of<ThemeService>(context, listen: false).isTheme
                      ? Icons.dark_mode
                      : Icons.light_mode))
        ],
      ),
      body: const CategoryFetcher(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => const ExpenseForm(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
