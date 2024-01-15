import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:health_tracker/widgets/bottom_navigation_bar.dart';
import 'package:health_tracker/widgets/main_drawer.dart';

import '../screens/chatbot_screen.dart';


class ChatBotWidget extends StatefulWidget {
  const ChatBotWidget({Key? key}) : super(key: key);

  @override
  _ChatBotWidgetState createState() => _ChatBotWidgetState();
}

class _ChatBotWidgetState extends State<ChatBotWidget> {
    late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
   // initDialogFlow();

    super.initState();
  }
  // Future<void> initDialogFlow() async {
  //   DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('HealthBot',
          style: TextStyle(

            color: Colors.white,
          ),),
        ),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: MessagesScreen(messages: messages)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              color: Theme.of(context).colorScheme.tertiary,
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                        controller: _controller,
                        style: TextStyle(color: Colors.white),
                      )),
                  IconButton(
                      onPressed: () {
                        sendMessage(_controller.text);
                        _controller.clear();
                      },
                      icon: Icon(Icons.send,
                      color: Colors.white,))
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) print('No message retuned');
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) async {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
    _controller.clear();
  }
}