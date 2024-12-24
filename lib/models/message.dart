import 'package:scholar_chat/constants.dart';
class Message {
  final String message;
  final String id ;
  final DateTime createdAt;
  Message(this.message, this.id, this.createdAt);

  factory Message.fromJson(jsonData) {
    return Message(jsonData[kMessage], jsonData[kId] , jsonData[kCreatedAt].toDate());
  }
}
