import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_tracker/widgets/bottom_navigation_bar.dart';
import '../widgets/main_drawer.dart';
final  _firebase = FirebaseAuth.instance;

class TaskScreen extends StatefulWidget{

  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() {
    return _TaskScreenState();
  }
}

class _TaskScreenState extends State<TaskScreen> {
  List tasks = List.empty();
  String title = "";
  String description = "";
  var email = {FirebaseAuth.instance.currentUser?.email};
  bool isChecked = false;
  // late CollectionReference _referenceTasks = FirebaseFirestore.instance.collection('users');
  //late Future<QuerySnapshot> _future = _referenceTasks.get();

  // fetchUsername() async {
  //   var snapshot = await FirebaseFirestore.instance
  //       .collection('users').doc(_firebase.currentUser!.uid).get();
  //
  //   if (snapshot.exists) {
  //     setState(() {
  //       email = snapshot.data()?['username'];
  //     });
  //   }}
    //
    // }
    // @override
    // void initState() {
    //   super.initState();
    //   // Call a function to fetch the username when the screen is initialized
    //   fetchUsername();
    // }


    createTask() {
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection('users').doc(_firebase.currentUser!.uid).collection(
          'task').doc(title);
      Map<String, Object> taskList = {
        'taskTitle': title,
        'taskDesc': description,
        'isCompleted' : false,
      };
      documentReference.set(taskList).whenComplete(() =>
          print('Data stored successfully'));
    }
    // createTask() {
    //   DocumentReference documentReference = FirebaseFirestore.instance
    //       .collection('Tasks').doc(title);
    //   Map<String, String> taskList = {
    //     'taskTitle': title,
    //     'taskDesc': description,
    //   };
    //   documentReference.set(taskList).whenComplete(() =>
    //       print('Data stored successfully'));
    // }

    deleteTask(item) {
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection('users')
          .doc(_firebase.currentUser!.uid)
          .collection('task')
          .doc(item);
      documentReference.delete().whenComplete(() =>
          print('Deleted successfully'));
    }

  Future completedTask(item, isChecked) async {
    DocumentReference documentReference =  await FirebaseFirestore.instance
        .collection('users')
        .doc(_firebase.currentUser!.uid)
        .collection('task')
        .doc(item.id.toString()) ;

    documentReference.update({'isCompleted' : isChecked }).whenComplete(() =>
        print('Updated successfully'));
  }



    @override
    Widget build(BuildContext context) {
      //username = fetchUsername.toString();
      Color getColor(Set<MaterialState> states){
        const Set<MaterialState> interactiveStates = <MaterialState>{
          MaterialState.pressed,
          MaterialState.hovered,
          MaterialState.focused,
        };
        if(states.any(interactiveStates.contains)){
          return Colors.green;
        }
        return Colors.transparent;

      }

      return Scaffold(
          appBar: AppBar(
            title: const Text('Task List ',
              //${FirebaseAuth.instance.currentUser!.username}
              style:  TextStyle(
                fontSize: 30,
              ),
            ),
            toolbarHeight: 120,
          ),
          drawer: const MainDrawer(),


          body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(_firebase.currentUser!.uid)
                .collection('task')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong.');
              }
              else if (snapshot.hasData || snapshot.data != null) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      QueryDocumentSnapshot<Object?>? documentSnapshot =
                      snapshot.data?.docs[index];
                      return Container(
                        margin: EdgeInsets.all(13.0),

                        child: Dismissible(
                            key: UniqueKey(),
                            child: Card(
                              elevation: 4,
                              child: Padding(
                        
                                padding: EdgeInsets.all(16.0),
                                // child: ListTile(
                                //   title: Text((documentSnapshot != null)
                                //       ? (documentSnapshot['taskTitle'])
                                //       : "",),
                                //   subtitle: Text((documentSnapshot != null)
                                //       ? (documentSnapshot['taskDesc'])
                                //       : ""),
                                //   leading: Checkbox(
                                //     checkColor: Colors.black,
                                //     fillColor: MaterialStateProperty.resolveWith(getColor),
                                //     value: isChecked,
                                //       onChanged: (bool? value){
                                //       setState(() {
                                //         isChecked = value!;
                                //       });
                                //       },
                                //     ),
                                //   trailing: IconButton(
                                //     onPressed: () {
                                //       setState(() {
                                //         // tasks.removeAt(index);
                                //         // deleteTask((documentSnapshot != null)
                                //         //     ? (documentSnapshot['taskTitle'])
                                //         //     : "");
                                //         deleteTask((documentSnapshot != null)
                                //             ? (documentSnapshot['taskTitle'])
                                //             : "");
                                //       });
                                //     },
                                //     icon: const Icon(Icons.delete),
                                //   ),
                                // ),
                                child: CheckboxListTile(
                                    title: Text((documentSnapshot != null)
                                        ? (documentSnapshot['taskTitle'])
                                        : ""),
                                    subtitle: Text((documentSnapshot != null)
                                        ? (documentSnapshot['taskDesc'])
                                        : ""),
                                    secondary: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            // tasks.removeAt(index);
                                            // deleteTask((documentSnapshot != null)
                                            //     ? (documentSnapshot['taskTitle'])
                                            //     : "");
                                            deleteTask((documentSnapshot != null)
                                                ? (documentSnapshot['taskTitle'])
                                                : "");
                                          });
                                        },
                                        icon: const Icon(Icons.delete),
                                      ),
                                    controlAffinity: ListTileControlAffinity.leading,
                                    value: documentSnapshot!['isCompleted'],
                                    onChanged: (bool? value){
                                        setState(() {
                                          completedTask( documentSnapshot ,value!);
                                        });
                                        },
                                  checkColor: Colors.black,
                                  activeColor: Colors.transparent,
                                ),
                              ),
                            )),
                      );
                    });
              }
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.red,
                  ),
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(

            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: const Text('Add task'),
                      content: Container(
                        width: 400,
                        height: 100,
                        child: Column(
                          children: [
                            TextField(
                              decoration: const InputDecoration(
                                hintText: 'Task Title'
                              ),
                              onChanged: (String value) {
                                title = value;
                              },
                            ),
                            TextField(
                              decoration: const InputDecoration(
                                  hintText: 'Task Description'
                              ),
                              onChanged: (String value) {
                                description = value;
                              },
                            ),

                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(

                            onPressed: () {
                              setState(() {
                                //tasks.add(title);
                                createTask();
                              });
                              Navigator.of(context).pop();
                            },
                            child: const Text('Add'))
                      ],
                    );
                  });
            },
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),

          ),


          bottomNavigationBar: const BottomNavigation()
      );
    }
}
