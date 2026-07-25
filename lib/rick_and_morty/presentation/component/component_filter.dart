// import 'package:flutter/material.dart';
// class ComponentFilter extends StatelessWidget {
//   const ComponentFilter({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: List.generate(
//           10,
//           (index) => Padding(
//             padding: const EdgeInsets.only(right: 10),
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade800,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Text(
//                 "hhhhhhh",
//                 style: const TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/rick_and_morty/domain/entites/CharacterFilterEntity.dart';
import 'package:rick_and_morty_app/rick_and_morty/presentation/controller/bloc/character_bloc.dart';

class ComponentFilter extends StatefulWidget {
  const ComponentFilter({super.key});

  @override
  State<ComponentFilter> createState() => _ComponentFilterState();
}

class _ComponentFilterState extends State<ComponentFilter> {
  String selectedFilter = "All";

  final List<String> filters = ["All", "Alive", "Dead", "Unknown"];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,

        itemCount: filters.length,

        itemBuilder: (context, index) {
          final filter = filters[index];

          final isSelected = selectedFilter == filter;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedFilter = filter;
              });

              if (filter == "All") {
                context.read<CharacterBloc>().add(GetCharacterEvent());
              } else {
                context.read<CharacterBloc>().add(
                  FilterCharactersEvent(
                    CharacterFilterEntity(status: filter.toLowerCase()),
                  ),
                );
              }
            },

            child: Container(
              margin: const EdgeInsets.only(right: 10),

              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),

              decoration: BoxDecoration(
                color: isSelected ? Colors.green : Colors.grey.shade800,

                borderRadius: BorderRadius.circular(20),
              ),

              child: Center(
                child: Text(
                  filter,

                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
