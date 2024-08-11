import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
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

  @override
  // TODO: implement props
  List<Object?> get props => [alldatas, heartdatas, ringdatas];
}
