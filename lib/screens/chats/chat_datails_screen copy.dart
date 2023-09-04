import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:red_cell_app/models/donate_model.dart';
import 'package:red_cell_app/models/user_model.dart';
import 'package:red_cell_app/screens/chats/cubit/social_cubit.dart';
import 'package:red_cell_app/screens/chats/cubit/social_state.dart';
import 'package:red_cell_app/screens/chats/models/message_model.dart';
//import 'package:red_cell_app/screens/chats/models/social_user_model.dart';

class ChatDetailsScreen2 extends StatelessWidget {
  var messageController = TextEditingController();
  DonateModel? donateModel;
  
  ChatDetailsScreen2(
    context, {
    super.key,
    this.donateModel,
  });
  
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
     // SocialCubit.get(context).getUserData();
      SocialCubit.get(context).getmessage(receiverId: donateModel!.uid);
      return BlocConsumer<SocialCubit, SocialStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: HexColor("#FFF9F0"),
            appBar: AppBar(
              backgroundColor: HexColor("#E9868E"),
              titleSpacing: 0.0,
              title: Row(
                children: [
                 donateModel!.profileImg == "imgProfile"
                    ? const CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            AssetImage("assets/images/img_profile.jpg"),
                      )
                    : CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            CachedNetworkImageProvider(donateModel!.profileImg!),
                      ),
                const SizedBox(
                  width: 15,
                ),
                Text(donateModel!.userName!,style: TextStyle(color: Colors.white),),
              ]),
            ),
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ConditionalBuilder(
                  condition: SocialCubit.get(context).message.isNotEmpty,
                  fallback: (BuildContext context) => Column(
                    children: [
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: textField(context),
                      ),
                    ],
                  ),
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.separated(
                              itemBuilder: (BuildContext context, int index) {
                                var message =
                                    SocialCubit.get(context).message[index];
                                if (SocialCubit.get(context).userModel!.uid ==
                                    message.senderId) {
                                  return buildMyMessage(message);
                                } else {
                                  return buildMessage(message);
                                }
                              },
                              itemCount: SocialCubit.get(context).message.length,
                              separatorBuilder: (BuildContext context, int index) =>
                                  const SizedBox(
                                height: 15,
                              ),
                            ),
                          ),
                         
                          textField(context),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      );
    });
  }

  Widget buildMyMessage(MessageModel model) => Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            color: HexColor("#E9868E"),
            borderRadius: const BorderRadiusDirectional.only(
              bottomStart: Radius.circular(10),
              topEnd: Radius.circular(10),
              topStart: Radius.circular(10),
            ),
          ),
          child: Text(model.text!,
            style: TextStyle(fontSize: (20),color: Colors.white),
          ),
        ),
      );

  Widget buildMessage(MessageModel model) => Align(
        alignment: AlignmentDirectional.centerStart,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(10),
              topEnd: Radius.circular(10),
              topStart: Radius.circular(10),
            ),
          ),
          child: Text(model.text!,style: TextStyle(fontSize: (20)),),
        ),
      );
        Widget textField(context) => Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey[300]!,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(15)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                  controller: messageController,
                  decoration: const InputDecoration(
                    hintText: "Type your message here .... ",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Container(
              //  width: 50,
              color: HexColor("#E9868E"),
              child: MaterialButton(
                onPressed: () {
                  SocialCubit.get(context).sendMessage(
                      receiverId: donateModel!.uid,
                      dateTime: DateTime.now().toString(),
                      text: messageController.text);
                  messageController.text = "";
                },
                minWidth: 1,
                child: const ImageIcon(
                  AssetImage("assets/images/Send.png"),
                  color: Colors.white,
                  size: 16,
                ),
              ),
            )
          ],
        ),
      );
}
