import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/rick_and_morty/presentation/controller/bloc/character_bloc.dart';
import 'package:rick_and_morty_app/rick_and_morty/presentation/screen/details_screen.dart';

class ComponentCharacters extends StatelessWidget {
  const ComponentCharacters({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CharacterBloc, CharacterState>(
        builder: (context, state) {
          if (state is GetCharacterLoadingState ||
              state is SearchCharacterLoading ||
              state is FilterCharacterLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is GetCharacterErrorState) {
            return Center(child: Text(state.message));
          }

          if (state is GetCharacterSuccessState) {
            return ListView.builder(
              itemCount: state.characters.length,
              itemBuilder: (context, index) {
                final character = state.characters[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Container(
                    height: 400,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0XFF282A2B),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 8,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(15),
                                ),
                                child: Image.network(
                                  character.image,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 12,
                                right: 12,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withValues(alpha: .7),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CircleAvatar(
                                        radius: 4,
                                        backgroundColor:
                                            character.status == "Alive"
                                            ? Colors.green
                                            : Colors.red,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        character.status,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  character.name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(character.species),
                                    const SizedBox(width: 8),
                                    Container(
                                      width: 1,
                                      height: 16,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(character.gender),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                const Divider(),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Text("Origin : "),
                                    Expanded(
                                      child: Text(
                                        character.origin.name,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) {
                                              return DetailsScreen(
                                                id: character.id,
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      child: Image.asset(
                                        "assets/images/Icon details.png",
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          if (state is SearchCharacterSuccess) {
            if (state.characters.isEmpty) {
              return const Center(
                child: Text(
                  "No Characters Found",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              );
            }
            return ListView.builder(
              itemCount: state.characters.length,
              itemBuilder: (context, index) {
                final character = state.characters[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Container(
                    height: 400,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0XFF282A2B),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 8,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(15),
                                ),
                                child: Image.network(
                                  character.image,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 12,
                                right: 12,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CircleAvatar(
                                        radius: 4,
                                        backgroundColor:
                                            character.status == "Alive"
                                            ? Colors.green
                                            : Colors.red,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        character.status,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  character.name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(character.species),
                                    const SizedBox(width: 8),
                                    Container(
                                      width: 1,
                                      height: 16,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(character.gender),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                const Divider(),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Text("Origin : "),
                                    Expanded(
                                      child: Text(
                                        character.origin.name,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) =>
                                                DetailsScreen(id: character.id),
                                          ),
                                        );
                                      },
                                      child: Image.asset(
                                        "assets/images/Icon details.png",
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }

          if (state is FilterCharacterSuccess) {
            if (state.characters.isEmpty) {
              return const Center(
                child: Text(
                  "No Characters Found",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              );
            }

            return ListView.builder(
              itemCount: state.characters.length,
              itemBuilder: (context, index) {
                final character = state.characters[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Container(
                    height: 400,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0XFF282A2B),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 8,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(15),
                                ),
                                child: Image.network(
                                  character.image,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 12,
                                right: 12,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CircleAvatar(
                                        radius: 4,
                                        backgroundColor:
                                            character.status == "Alive"
                                            ? Colors.green
                                            : Colors.red,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        character.status,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  character.name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(character.species),
                                    const SizedBox(width: 8),
                                    Container(
                                      width: 1,
                                      height: 16,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(character.gender),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                const Divider(),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Text("Origin : "),
                                    Expanded(
                                      child: Text(
                                        character.origin.name,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) =>
                                                DetailsScreen(id: character.id),
                                          ),
                                        );
                                      },
                                      child: Image.asset(
                                        "assets/images/Icon details.png",
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }

          if (state is SearchCharacterError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
