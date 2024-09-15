import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:side_project/model/Nested/Contacts.dart';
import '../MessageModel.dart';

@immutable
class MappingMessageModel extends Equatable {
  late List<MessageModel> alldatas;
  late List<MessageModel> ringdatas;
  late List<MessageModel> heartdatas;

  MappingMessageModel(
      {required this.alldatas,
      required this.heartdatas,
      required this.ringdatas});

  MappingMessageModel.fromJson(List<dynamic> Json) {
    alldatas = List<MessageModel>.empty(growable: true);
    ringdatas = List<MessageModel>.empty(growable: true);
    heartdatas = List<MessageModel>.empty(growable: true);

    for (Map<String, dynamic> a in Json) {
      //거부한 메세지는 처리 안함
      if (a['status'] != "refused") {
        final messageModel = MessageModel.fromJson(a);
        alldatas.add(messageModel);
        if (a["message_type"]['name'] == 'heart') {
          heartdatas.add(messageModel);
        }
        if (a["message_type"]['name'] == 'ring') {
          ringdatas.add(messageModel);
        }
      }
    }
  }

  MappingMessageModel.dummyData() {
    alldatas = List<MessageModel>.empty(growable: true);
    ringdatas = List<MessageModel>.empty(growable: true);
    heartdatas = List<MessageModel>.empty(growable: true);

    MessageModel messageModel = new MessageModel(
        id: 1,
        contacts: [],
        sender_name: 'test ',
        receiver_name: 'test',
        message_type: null,
        status: null,
        content: 'test');
    for (int a = 0; a < 10; a++) {
      alldatas.add(messageModel);
      heartdatas.add(messageModel);
      ringdatas.add(messageModel);
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [alldatas, heartdatas, ringdatas];
}
