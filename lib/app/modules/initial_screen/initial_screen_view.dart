import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'initial_screen_controller.dart';

class InitialScreenView extends GetView<InitialScreenController> {
  const InitialScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InitialScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'InitialScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
