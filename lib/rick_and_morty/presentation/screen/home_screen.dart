import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/constants/custom_textfaild.dart';
import 'package:rick_and_morty_app/core/services/services_loactor.dart';
import 'package:rick_and_morty_app/rick_and_morty/presentation/component/component_characters.dart';
import 'package:rick_and_morty_app/rick_and_morty/presentation/component/component_filter.dart';
import 'package:rick_and_morty_app/rick_and_morty/presentation/controller/bloc/character_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CharacterBloc>()..add(GetCharacterEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 4,
          shadowColor: Colors.white.withValues(alpha: 0.15),

          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/logo leading.png"),
          ),

          title: const Text(
            "Portal Explorer",
            style: TextStyle(color: Color(0XFFB2EB65)),
          ),

          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Image.asset("assets/images/Icon.png"),
            ),
          ],

          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              height: 1,
              color: Colors.white.withValues(alpha: 0.2), // الخط اللي تحت
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 20),
              ComponentTextFaild(
                controller: searchController,
                hintText: 'Search characters...',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
              ),
              SizedBox(height: 20),
              ComponentFilter(),
              SizedBox(height: 20),
              ComponentCharacters(),
            ],
          ),
        ),
      ),
    );
  }
}
