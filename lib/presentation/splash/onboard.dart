import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/core/router/route_names.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_donate_app/presentation/viewmodel/splash/splash_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class OnboardView extends ConsumerStatefulWidget {
  const OnboardView({super.key});

  @override
  ConsumerState createState() => _OnboardViewState();
}

class _OnboardViewState extends ConsumerState<OnboardView> {
  late SplashViewModel splashViewModel;

  @override
  void initState() {
    splashViewModel = ref.read(splashViewModelImp);
    splashViewModel.setInitialScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    splashViewModel = ref.watch(splashViewModelImp);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is a Onboard View'),
            ElevatedButton(
              onPressed: () {
                if(splashViewModel.setInitialScreenResponse.isCompleted()) {
                  context.goNamed(AppRouteName.signin.name);
                }
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
