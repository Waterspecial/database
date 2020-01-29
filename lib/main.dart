import 'package:adatabase/models/user.dart';
import 'package:adatabase/utils/database_helper.dart';
import 'package:flutter/material.dart';
//import './ui/ui.dart';

List _user;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var db = new DatabaseHelper();

  // add user
   await db.saveUser(new User("Toba", "Onikoyi"));
//  print("User Saved $savedUser");


    int count = await db.getCount();
    print("Count: $count");
  //print("User Saved $savedUser");

  //Retrieving a user
  User sam = await db.getUser(1);
  User samUpdate = User.fromMap({
    "username" : "updatedsam",
    "password" : "updatedpassowrd",
    "id"       : 1

  });
  await db.updateUser(samUpdate);

  //print("Got Username: ${sam.username}");

  //updating a user


  //Delete a user
//  int userDeleted = await db.deleteUser(3);
//  print("User Deleted: $userDeleted");

// get user
  _user = await db.getAllUsers();
  for(int i = 0; i < _user.length; i++){
    User user = User.map(_user[i]);
    print("Username: ${user.username}, User Id: ${user.id}");
  }


  runApp(MaterialApp(
    title: "Database",
    theme: ThemeData.light(),
    home: new Home(),
  ));

}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
       title: new Text("Database"),
      centerTitle: true,
      backgroundColor: Colors.lightGreenAccent,
    ),
      body: new ListView.builder(
          itemCount: _user.length,
          itemBuilder: (_, int position){
            return new Card(
              color: Colors.white,
              elevation: 2.0,
              child: new ListTile(
                leading: new CircleAvatar(
                    child: new Text("${User.fromMap(_user[position]).username.substring(0, 1)}")),
                title: new Text("User: ${User.fromMap(_user[position]).username}"),
                subtitle: new Text("Id:${User.fromMap(_user[position]).id}"),
                onTap: () => debugPrint("${User.fromMap(_user[position]).password}"),
              ),
            );
          }),
    );
  }
}



