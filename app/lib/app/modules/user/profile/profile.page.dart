import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/user/profile/profile.controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Text("Profile"),
        ),
      ),
    );
  }
}
