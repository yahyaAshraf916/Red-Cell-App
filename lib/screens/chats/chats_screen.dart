import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_cell_app/models/user_model.dart';
import 'package:red_cell_app/screens/chats/chat_datails_screen.dart';
import 'package:red_cell_app/screens/chats/cubit/social_cubit.dart';
import 'package:red_cell_app/screens/chats/cubit/social_state.dart';
import 'package:red_cell_app/screens/chats/models/social_user_model.dart';

class ChatsScreen extends StatelessWidget {
  UserData? userModel;
  ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: ConditionalBuilder(
            builder: (context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    children: [
                      Image(
                          height: MediaQuery.of(context).size.height * .233,
                          width: double.infinity,
                          image: AssetImage("assets/images/Group 1109.png")),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 55, horizontal: 20),
                        child: Row(
                          children: const [
                            Text(
                              "chat",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                      child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return buildChatItem(
                          SocialCubit.get(context).users[index], context);
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        myDivider(),
                    itemCount: SocialCubit.get(context).users.length,
                  )),
                ],
              );
            },
            condition: //  SocialCubit.get(context).message.isNotEmpty,
                SocialCubit.get(context).users.isNotEmpty,
            fallback: (BuildContext context) => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }

  Widget buildChatItem(UserData model, context) => InkWell(
        onTap: () {
          navigateTo(
              context,
              ChatDetailsScreen(
                userModel: model,
                context,
              ));
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              model.profileImg == "imgProfile"
                  ? const CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          AssetImage("assets/images/img_profile.jpg"),
                    )
                  : CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          CachedNetworkImageProvider(model.profileImg!),
                    ),
              const SizedBox(
                width: 15,
              ),
              Text(
                model.userName!,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, height: 1.4),
              ),
            ],
          ),
        ),
      );
}

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 20),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey[300],
      ),
    );

void navigateTo(context, Widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Widget,
      ),
    );
