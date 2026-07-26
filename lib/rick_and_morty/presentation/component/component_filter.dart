import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      height: 40.h,

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
              margin: EdgeInsets.only(right: 10.w),

              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),

              decoration: BoxDecoration(
                color: isSelected ? Colors.green : Colors.grey.shade800,

                borderRadius: BorderRadius.circular(20.r),
              ),

              child: Center(
                child: Text(
                  filter,

                  style: TextStyle(
                    fontSize: 20.sp,
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
