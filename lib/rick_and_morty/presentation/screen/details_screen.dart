import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/constants/CharacterDetailsShimmer.dart';
import 'package:rick_and_morty_app/core/constants/constant_elevetadbuttom.dart';
import 'package:rick_and_morty_app/core/services/services_loactor.dart';
import 'package:rick_and_morty_app/rick_and_morty/presentation/component/component_identity.dart';
import 'package:rick_and_morty_app/rick_and_morty/presentation/component/component_last_known_coordinates.dart';
import 'package:rick_and_morty_app/rick_and_morty/presentation/component/component_Pilot.dart';
import 'package:rick_and_morty_app/rick_and_morty/presentation/component/component_vital_signs.dart';
import 'package:rick_and_morty_app/rick_and_morty/presentation/component/component_image_details.dart';
import 'package:rick_and_morty_app/rick_and_morty/presentation/controller/bloc/character_bloc.dart';

class DetailsScreen extends StatelessWidget {
  final int id;
  const DetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<CharacterBloc>()..add(GetCharacterDetailsEvent(id)),
      child: Scaffold(
        body: Scaffold(
          body: BlocBuilder<CharacterBloc, CharacterState>(
            builder: (context, state) {
              if (state is GetCharacterDetailsLoadingState) {
                return CharacterDetailsShimmer();
              }

              if (state is GetCharacterDetailsErrorState) {
                return Center(child: Text(state.message));
              }

              if (state is GetCharacterDetailsSuccessState) {
                final character = state.characterDetails;

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      ComponentImageDetails(
                        name: character.name,
                        image: character.image,
                      ),

                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ComponentVitalSigns(
                              status: character.status,
                              species: character.species,
                            ),

                            const SizedBox(height: 20),

                            ComponentIdentity(
                              gender: character.gender,
                              origin: character.origin.name,
                            ),

                            const SizedBox(height: 20),

                            ComponentLastKnownCoordinates(
                              location: character.location.name,
                            ),

                            const SizedBox(height: 35),

                            Row(
                              children: const [
                                Text(
                                  "Episode Appearances",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Text("51"),
                                SizedBox(width: 5),
                                Text("Total"),
                              ],
                            ),

                            const SizedBox(height: 25),

                            ComponentPilot(time: character.created),

                            const SizedBox(height: 40),

                            BlocConsumer<CharacterBloc, CharacterState>(
                              listener: (context, state) {
                                if (state is ExportCharacterSuccessState) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Excel exported successfully",
                                      ),
                                    ),
                                  );
                                }

                                if (state is ExportCharacterErrorState) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(state.message)),
                                  );
                                }
                              },
                              builder: (context, state) {
                                return ConstantElevetadbuttom(
                                  isLoading:
                                      state is ExportCharacterLoadingState,
                                  onPressed: () {
                                    context.read<CharacterBloc>().add(
                                      ExportCharacterEvent(character),
                                    );
                                  },
                                );
                              },
                            ),
                            const SizedBox(height: 30),

                            const Center(
                              child: Text(
                                "Generating an interdimensional manifest for\n"
                                "specific biological entity Requires\n"
                                "level 4 clearance from the Galactic\n"
                                "Federation.",
                                textAlign: TextAlign.center,
                              ),
                            ),

                            const SizedBox(height: 50),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
