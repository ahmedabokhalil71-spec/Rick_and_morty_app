import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/rick_and_morty/presentation/controller/bloc/character_bloc.dart';
import 'package:rick_and_morty_app/rick_and_morty/presentation/screen/details_screen.dart';

class ComponentCharacters extends StatelessWidget {
  const ComponentCharacters({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CharacterBloc, CharacterState>(
        builder: (context, state) {
          // Loading
          if (state is GetCharacterLoadingState ||
              state is SearchCharacterLoading ||
              state is FilterCharacterLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // ErrorState
          if (state is GetCharacterErrorState) {
            return Center(child: Text(state.message));
          }
          if (state is SearchCharacterError) {
            return Center(child: Text(state.message));
          }
          // Success
          List<dynamic>? characters;

          if (state is GetCharacterSuccessState) {
            characters = state.characters;
          } else if (state is SearchCharacterSuccess) {
            characters = state.characters;
          } else if (state is FilterCharacterSuccess) {
            characters = state.characters;
          }

          if (characters != null) {
            return CharacterListView(characters: characters);
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class CharacterListView extends StatelessWidget {
  final List<dynamic> characters;

  const CharacterListView({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    if (characters.isEmpty) {
      return Center(
        child: Text(
          "No Characters Found",
          style: TextStyle(color: Colors.white, fontSize: 18.sp),
        ),
      );
    }

    return ListView.builder(
      itemCount: characters.length,
      itemBuilder: (context, index) {
        return CharacterCardItem(character: characters[index]);
      },
    );
  }
}

class CharacterCardItem extends StatelessWidget {
  final dynamic character;

  const CharacterCardItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        height: 400.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0XFF282A2B),
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
        ),
        child: Column(
          children: [
            // صورة الشخصية والشارة (Status)
            Expanded(
              flex: 8,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15.r),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: character.image,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Image.asset(
                        "assets/images/character.png",
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12.h,
                    right: 12.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: .7),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 4,
                            backgroundColor: character.status == "Alive"
                                ? Colors.green
                                : Colors.red,
                          ),
                          SizedBox(width: 6.w),
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
            SizedBox(height: 20.h),
            // بيانات الشخصية التفصيلية
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      character.name,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Text(character.species),
                        SizedBox(width: 8.w),
                        Container(width: 1, height: 16.h, color: Colors.grey),
                        SizedBox(width: 8.w),
                        Text(character.gender),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Divider(),
                    SizedBox(height: 5.h),
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
                                builder: (_) => DetailsScreen(id: character.id),
                              ),
                            );
                          },
                          child: Image.asset("assets/images/Icon details.png"),
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
  }
}
