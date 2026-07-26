import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/core/constants/internet_wrapper.dart';
import 'package:rick_and_morty_app/core/constants/no_internet.dart';
import 'package:rick_and_morty_app/core/services/services_loactor.dart';
import 'package:rick_and_morty_app/rick_and_morty/presentation/controller/no_internet_bloc/no_internet_bloc.dart';
import 'package:rick_and_morty_app/rick_and_morty/presentation/screen/splach_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await servicesLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(389.989990234375, 928),
      child: BlocProvider(
        create: (_) => sl<NoInternetBloc>()..add(CheckInternetConnection()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          home: const SplachScreen(),

          builder: (context, child) {
            return InternetWrapper(child: child!);
          },
        ),
      ),
    );
  }
}
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await servicesLocator();

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(389.989990234375, 928),
//       child: BlocProvider(
//         create: (_) => sl<NoInternetBloc>()..add(CheckInternetConnection()),
//         child: MaterialApp(
//           debugShowCheckedModeBanner: false,
//           theme: ThemeData.dark(),

//           home: const SplachScreen(),

//           builder: (context, child) {
//             return InternetCheckerWrapper(child: child!);
//           },
//         ),
//         //  MaterialApp(
//         //   debugShowCheckedModeBanner: false,
//         //   theme: ThemeData.dark(),
//         //   home: BlocBuilder<NoInternetBloc, NoInternetState>(
//         //     builder: (context, state) {
//         //       if (state is InternetDisconnectedState) {
//         //         return const HomeShimmer();
//         //       }

//         //       return InternetWrapper(child: const SplachScreen());
//         //     },
//         //   ),
//         // ),
//       ),
//     );
//   }
// }
