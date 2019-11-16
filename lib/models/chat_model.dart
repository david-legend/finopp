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
    imageUrl:
        "assets/images/finop/novastar.jpg",
  ),
  new ChatModel(
    name: "Kenza",
    message: "I have found a new niche and I want to discuss it with you.",
    time: "02:16",
    imageUrl:
        "assets/images/finop/kenza_lahlou.jpg",
  ),
  new ChatModel(
    name: "Muthoni",
    message: "I have to pitch this idea on 7th December.",
    time: "11:11",
    imageUrl:
        "assets/images/finop/muthoni_wachira.jpg",
  ),
  new ChatModel(
    name: "Mehak",
    message: "I am working on the new feature.",
    time: "20:21",
    imageUrl:
        "assets/images/finop/mehak_malik.jpg",
  ),
  new ChatModel(
    name: "Bare Hands",
    message: "I will send you the prototype next week.",
    time: "1:12",
    imageUrl:
        "assets/images/finop/logo1.jpeg",
  ),
  new ChatModel(
    name: "Takuma",
    message: "I don't believe in this idea anymore. I want to quit.",
    time: "1:12",
    imageUrl:
        "assets/images/finop/takuma_terakubo.jpg",
  ),
  new ChatModel(
    name: "Yassine",
    message: "Please, when are we meeting the investor.",
    time: "1:12",
    imageUrl:
        "assets/images/finop/yassine_oussaifi.jpg",
  ),
];
