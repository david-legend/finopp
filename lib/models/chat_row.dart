class ChatRow {
  String name;
  String lastMessage;
  int unreadMessages;
  String timestamp;
  String profileUrl;

  ChatRow(
      {this.name,
      this.lastMessage,
      this.unreadMessages,
      this.timestamp,
      this.profileUrl});
}

class ChatRowsProvider {
  static final List<ChatRow> chatRows = [
    ChatRow(
        name: "Kwabena Darkwa",
        unreadMessages: 2,
        lastMessage: "I am glad you are here with me. Here at the end of all things, David.",
        timestamp: "01:05 PM",
        profileUrl:
            "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.uW116YzG5BztduTPZc7uegHaEt%26pid%3DApi&f=1"),
    ChatRow(
        name: "CYST",
        unreadMessages: 0,
        lastMessage: "I have found a new niche and I want to discuss it with you.",
        timestamp: "01:02 PM",
        profileUrl:
            "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.onUzDzIaCFlh1LgLyhdK2AHaE7%26pid%3DApi&f=1"),
    ChatRow(
        name: "Osei Andy",
        unreadMessages: 0,
        lastMessage: "I have to pitch this idea on 7th December.",
        timestamp: "09:23 AM",
        profileUrl:
            "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.onUzDzIaCFlh1LgLyhdK2AHaE7%26pid%3DApi&f=1"),
    ChatRow(
        name: "Neila Opoku",
        unreadMessages: 1,
        lastMessage: "I am working on the new feature.",
        timestamp: "11:49 AM",
        profileUrl:
            "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.vqlkxb-pA65TdJ5PvwBdBAHaE2%26pid%3DApi&f=1"),
    ChatRow(
        name: "Pauline Cobbina",
        unreadMessages: 2,
        lastMessage: "II will send you the prototype next week.",
        timestamp: "09:12AM",
        profileUrl:
            "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.onUzDzIaCFlh1LgLyhdK2AHaE7%26pid%3DApi&f=1"),
    ChatRow(
        name: "Eric Asare",
        unreadMessages: 0,
        lastMessage: "I don't believe in this idea anymore. I want to quit.",
        timestamp: "01:02 PM",
        profileUrl:
            "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.v9tUwCUgmDHmYqxi_65nKAHaE8%26pid%3DApi&f=1"),
    ChatRow(
      name: "Romeo Foli",
      unreadMessages: 0,
      lastMessage: "Please, when are we meeting the investor.",
      timestamp: "09:23 AM",
      profileUrl:
          "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.onUzDzIaCFlh1LgLyhdK2AHaE7%26pid%3DApi&f=1",
    ),
  ];
}
