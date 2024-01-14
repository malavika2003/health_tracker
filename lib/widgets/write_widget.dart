import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_tracker/screens/read_screen.dart';
final  _firebase = FirebaseAuth.instance;

class WriteWidget extends StatefulWidget {
  const WriteWidget({super.key});

  @override
  State<WriteWidget> createState() => _WriteWidgetState();
}

class _WriteWidgetState extends State<WriteWidget> {
  List journals = List.empty();
  String title = "";
  String description = "";
  var email = {FirebaseAuth.instance.currentUser?.email};
  final descController = TextEditingController();
  final titleController = TextEditingController();

  createJournal(title, description){
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('users').doc(_firebase.currentUser!.uid)
        .collection('journals').doc(title);
    Map<String, Object> journalList = {
      'jTitle' : title,
      'jDesc': description,
    };
    documentReference.set(journalList).whenComplete(() =>
    print('Data stored successfully'));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Write down",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        toolbarHeight: 120,
      ),

      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.title,
                  ),
                  hintText: "Let's know your title"
                ),
              ),
              SizedBox(height: 14,),
              TextFormField(
                controller: descController,
                autofocus: true,
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 30,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.stars_outlined,
                  ),
                  hintText: "Chalo batao kya hua?"
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: (){
                        createJournal(titleController.text, descController.text);
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>  ReadScreen()));

                      },
                      child: Text('Save'),
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),),
                ],
              )

            ],

          ),

        ),
      ),




    );
  }
}

