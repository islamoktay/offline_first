import 'package:flutter/material.dart';

import 'package:offline_first/core/constant/app_constants.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppConstants.appName)),
      body: const Center(
        child: Text('Home View'),
      ),
    );
  }
}
