import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:side_project/bloc/ReceivedMessageBloc.dart';
import 'package:side_project/bloc/event/ReceivedMessageEvent.dart';
import 'package:side_project/controller/ApiController.dart';
import 'package:side_project/model/Mapping/MappingMessageModel.dart';
import 'package:side_project/model/MessageModel.dart';

@immutable
class ReceivedMessageRepository extends Equatable {
  late ApiController apiController;
  late List<MessageModel> receive_message;
  late List<MessageModel> heart_receive;
  late List<MessageModel> ring_receive;

  Future<void> getData() async {
    apiController = new ApiController<ReceivedMessageLoadEvent>();
    try {
      final response = await apiController.apiCategorize();
      final _mappingMessageModel = MappingMessageModel.fromJson(response.data);

      receive_message = _mappingMessageModel.alldatas;
      heart_receive = _mappingMessageModel.heartdatas;
      ring_receive = _mappingMessageModel.ringdatas;
    } catch (e) {
      print(e);
      throw Exception("오류 발생");
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [receive_message, heart_receive, ring_receive];
}
