import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laba_http/screens/cubit/nasa_cubit.dart';
import 'package:laba_http/screens/main_screen.dart';

class MainScreenProvider extends StatelessWidget {
  const MainScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NasaCubit()..getData(),
      child: const MainScreen(),
    );
  }
}
