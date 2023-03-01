import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_cell_app/models/social_user_model.dart';
import 'package:red_cell_app/modules/chat_details/chat_datails_screen.dart';
import 'package:red_cell_app/shared/components/components.dart';
import 'package:red_cell_app/shared/cubit/red_cell_cubit.dart';
import 'package:red_cell_app/shared/cubit/red_cell_state.dart';



class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RedCellCubit, RedCellStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ConditionalBuilder(
          builder: (context) {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) =>
                  buildChatItem(
                  RedCellCubit.get(context).users[index],context),
              separatorBuilder: (BuildContext context, int index) => myDivider(),
              itemCount: RedCellCubit.get(context).users.length,
            );
          }, condition: RedCellCubit.get(context).users.isNotEmpty, fallback: (BuildContext context) =>const Center(child: 
          CircularProgressIndicator(),),
        );
      },
    );
  }

  Widget buildChatItem(SocialUserModel model,context) => InkWell(
        onTap: () {
          navigateTo(context, ChatDetailsScreen(userModel: model,context));
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: CachedNetworkImageProvider(model.image!),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                model.name!,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, height: 1.4),
              ),
            ],
          ),
        ),
      );
}
