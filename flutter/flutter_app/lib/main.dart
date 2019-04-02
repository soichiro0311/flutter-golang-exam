import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'User Manager'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _userName ='';
  int _userAge = 0;

  List<User> _displayUsers = new List();

  @override
  void initState(){
   super.initState();
   _getUser();
  }
  void _addUserRequest(){
    var api = new AddUserApi();
    User user = new User(this._userName,this._userAge);
    api.userAddPost(user: user);
  }

  void _addUser() {
    showDialog(context: context,
      builder: (BuildContext context) => Theme(
        data: Theme.of(context).copyWith(dialogBackgroundColor: Colors.white),
        child: SimpleDialog(title: Text("Register User"), children: <Widget>[
          new TextField(
              decoration: new InputDecoration(labelText: "Enter register user name "),
              onChanged: (v) => this._userName = v,
            ),
            new TextField(
              decoration: new InputDecoration(labelText: "Enter register user age"),
              keyboardType: TextInputType.number,
              onChanged: (v) => this._userAge = int.parse(v),
            ),
            FloatingActionButton(
              onPressed: _addUserRequest,
              child: Text("register"),
              shape: RoundedRectangleBorder(),
              backgroundColor: Colors.green,
            )
        ],)
      )
    );
  }

  void _getUser() {
    var api = new UsersApi();
    Future<List<User>> users = api.usersGet();
    users.then((content) =>  setState(() {
        content.sort((a,b) => a.id.compareTo(b.id));
        this._displayUsers = content;
    }));
  }

  String formatUserData(User user){
    return "ID:" + user.id + " NAME:" + user.name + " AGE:" + user.age.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: 
        ListView.builder(
          itemCount: this._displayUsers.length,
          itemBuilder: (context, int index) {
            return Card(
              child: Padding(
                child: Text(formatUserData(this._displayUsers.elementAt(index)), style: TextStyle(fontSize: 22.0),),
                padding: EdgeInsets.all(20.0),
              ),
            );
          },
        ),
      floatingActionButton: Column(
        verticalDirection: VerticalDirection.up, // childrenの先頭を下に配置
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _addUser,
            tooltip: 'User Register',
            child: Icon(Icons.add),
          ),
          Container( // 余白のためContainerでラップ
            margin: EdgeInsets.only(bottom: 16.0), 
            child: FloatingActionButton(
              onPressed: _getUser,
              tooltip: 'All User Get',
              child: Icon(Icons.autorenew),
            ),
          ),
        ],
      ),
    );
  }
}
