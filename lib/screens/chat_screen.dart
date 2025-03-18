import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/cubits/chat_cubit/chat_cubit.dart';
import 'package:scholar_chat/models/message.dart';
import 'package:scholar_chat/widgets/chat_buble.dart';

class ChatScreen extends StatelessWidget {
  static String id = 'ChatScreen';
  List<Message> messagesList = [];
  TextEditingController messageController = TextEditingController();
  final _scrollController = ScrollController();

  ChatScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        clipBehavior: Clip.antiAlias, // info: make the appbar rounded
        backgroundColor: kPrimaryColor,
        centerTitle: true, // info: make the title in the center
        automaticallyImplyLeading: false, // info: remove the back button
        title: Row(
          mainAxisAlignment: MainAxisAlignment
              .center, // info: align the children in the center
          children: [
            Image.asset(kLogoPath,
                height: 50), // info: use the kLogoPath constant
            const Text('Chat',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontFamily: 'pacifico',
                )), // info: add a Text widget
          ],
        ),
      ), //info: end of AppBar
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatCubit, ChatState>(
              listener: (context, state) {
                if (state is ChatSuccess) {
                  messagesList = state.messagesList;
                }
              },
              builder: (context, state) {
                return ListView.builder(
                    reverse: true,
                    controller: _scrollController,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return messagesList[index].id == email
                          ? ChatBuble(message: messagesList[index])
                          : ChatBubleForFriend(message: messagesList[index]);
                    });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: messageController,
              onSubmitted: (data) {
                BlocProvider.of<ChatCubit>(context)
                    .sendMessage(message: data, email: email.toString());
                messageController.clear();
                _scrollController.animateTo(
                  0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
              decoration: InputDecoration(
                  hintText: 'Type a message',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(),
                  ),
                  suffixIcon: const Icon(
                    Icons.send,
                    color: kPrimaryColor,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
