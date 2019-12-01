import 'package:finop/const/_const.dart';

class ChatModel {
  final String name;
  String message;
  final String time;
  final String imageUrl;

  ChatModel({this.name, this.message, this.time, this.imageUrl});
}

List<ChatModel> messageData = [
  new ChatModel(
    name: "Novastar",
    message:
        "I am glad you are here with me. Here at the end of all things, David.",
    time: "12:12",
    imageUrl: AppImagePath.novaStar,
  ),
  new ChatModel(
    name: "Kenza",
    message: "I have found a new niche and I want to discuss it with you.",
    time: "02:16",
    imageUrl: AppImagePath.kenzaLahlou,
  ),
  new ChatModel(
    name: "Muthoni",
    message: "I have to pitch this idea on 7th December.",
    time: "11:11",
    imageUrl: AppImagePath.muthoniWachira,
  ),
  new ChatModel(
    name: "Mehak",
    message: "I am working on the new feature.",
    time: "20:21",
    imageUrl: AppImagePath.mehakMalik,
  ),
  new ChatModel(
    name: "Gary",
    message: "I will send you the prototype next week.",
    time: "1:12",
    imageUrl: AppImagePath.garyVee,
  ),
  new ChatModel(
    name: "Takuma",
    message: "I don't believe in this idea anymore. I want to quit.",
    time: "1:12",
    imageUrl: AppImagePath.takuma,
  ),
  new ChatModel(
    name: "Yassine",
    message: "Please, when are we meeting the investor.",
    time: "1:12",
    imageUrl: AppImagePath.yassineOussaifi,
  ),
];
