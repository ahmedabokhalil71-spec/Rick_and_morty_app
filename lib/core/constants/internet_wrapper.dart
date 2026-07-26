import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/constants/no_internet.dart';
import 'package:rick_and_morty_app/rick_and_morty/presentation/controller/no_internet_bloc/no_internet_bloc.dart';

class InternetWrapper extends StatelessWidget {
  final Widget child;

  const InternetWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoInternetBloc, NoInternetState>(
      builder: (context, state) {
        return Stack(
          children: [
            child,

            if (state is InternetDisconnectedState)
              const Positioned.fill(
                child: ColoredBox(color: Colors.black, child: HomeShimmer()),
              ),
          ],
        );
      },
    );
  }
}
