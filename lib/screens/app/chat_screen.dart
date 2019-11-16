import 'package:finop/models/chat_model.dart';
import 'package:flutter/material.dart';

//TODO:: change color of back button

class ChatScreen extends StatefulWidget {
  final String name;
  final String profileImage;

  ChatScreen({this.name, this.profileImage});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final TextEditingController _textController = new TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];
  bool isType = false;

  void _handleSubmit(String text) {
    ChatMessage message = new ChatMessage(
      text: text,
      animationController: new AnimationController(
          duration: new Duration(seconds: 0), vsync: this),
      name: widget.name,
    );
    setState(() {
      _messages.insert(0, message);
      var data = messageData.firstWhere((t) => t.name != widget.name);
      data.message = message.text;
    });
    message.animationController.forward();
  }

  Widget _buildText() {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Container(
            child: new Flexible(
                child: new TextField(
              controller: _textController,
              maxLines: 2,
              decoration: InputDecoration(
                  hintText: "Send message",
                  contentPadding: const EdgeInsets.all(8.0)),
            )),
          ),
          new Container(
            child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: () {
                  _handleSubmit(_textController.text);
                  _textController.clear();
                }),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.white),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.call, color: Colors.black,),
            onPressed: () {},
          ),
          new IconButton(
            icon: new Icon(Icons.more_vert, color: Colors.black,),
            onPressed: () {},
          )
        ],
        title: new Container(
            child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              // padding: const EdgeInsets.fromLTRB(0, 0, 3.0, 0),
              child: new Center(
                  child: CircleAvatar(
                backgroundImage: AssetImage(widget.profileImage),
                maxRadius: 22,
              )),
            ),
            new Container(
              padding: const EdgeInsets.only(left: 8.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Center(
                    child: new Text(
                      widget.name,
                      style: Theme.of(context).textTheme.title,
                    ),
                  ),
                  new Text(
                    "last seen. 18:00",
                    style: new TextStyle(
                        fontSize: 13.0,
                        color: Colors.black,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Flexible(
              child: new ListView.builder(
                padding: new EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (context, int index) => _messages[index],
                itemCount: _messages.length,
              ),
            ),
            new Divider(
              height: 1.0,
            ),
            new Container(
              child: _buildText(),
            )
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String name;
  final AnimationController animationController;
  final String text;

  ChatMessage({this.name, this.animationController, this.text});

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: new CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(
                backgroundImage:
                    AssetImage('assets/images/finop/david_cobbina.jpg'),
                maxRadius: 25.0,
              ),
            ),
            new Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text("David",
                      style: new TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold)),
                  new Container(
                      margin: const EdgeInsets.only(top: 6.0),
                      child: new Text(text,
                          style: new TextStyle(
                              color: Colors.black, fontSize: 18.0)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
