import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_donate_app/core/router/route_names.dart';
import 'package:flutter_donate_app/presentation/widgets/button/custom_elevated_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Welcome extends ConsumerStatefulWidget {
  const Welcome({super.key});

  @override
  ConsumerState createState() => _WelcomeState();
}

class _WelcomeState extends ConsumerState<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome Page')),
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: CustomElevatedButton(
                onPressed: () {
                  context.goNamed(AppRouteName.signin.name);
                },
                text: 'Giriş Yap',
              ),
            ),
            Expanded(
              child: CustomElevatedButton(
                onPressed: () {
                  context.goNamed(AppRouteName.signup.name);
                },
                text: 'Kayıt Ol',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
