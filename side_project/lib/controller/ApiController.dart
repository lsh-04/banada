import 'dart:developer';

import 'package:side_project/api/Request_Api.dart';
import 'package:dio/dio.dart';
import 'package:side_project/dto/ContactsDto.dart';
import 'package:side_project/dto/MessageSentDto.dart';
import 'package:side_project/dto/MessageUpdateDto.dart';
import 'package:side_project/dto/RegisterPart1Dto.dart';
import 'package:side_project/dto/RegisterPart2Dto.dart';
import 'package:side_project/dto/SimulationDto.dart';
import 'package:side_project/viewModel/bloc/DailyFourIntroduceBloc.dart';
import 'package:side_project/viewModel/bloc/NickNameValidBloc.dart';
import 'package:side_project/viewModel/bloc/RegisterBloc.dart';
import 'package:side_project/viewModel/bloc/SimulationBloc.dart';
import 'package:side_project/viewModel/bloc/SplashBloc.dart';
import 'package:side_project/viewModel/bloc/event/MyProfileEvent.dart';
import 'package:side_project/viewModel/bloc/event/OtherProfilesEvent.dart';
import 'package:side_project/viewModel/bloc/event/PastMatchEvent.dart';
import 'package:side_project/viewModel/bloc/event/ReceivedMessageEvent.dart';
import 'package:side_project/viewModel/bloc/event/SentMessageEvent.dart';

class ApiController<T> extends Request_Api {
  late Response _response;
  static const String _messageRecived = 'message/received/';
  static const String _todayProfiles = 'profiles/today/';
  static const String _messageRefuse = 'message/';
  static const String _messageSent = 'message/sent/';
  static const String _profile = 'profiles/';
  static const String _myprofile = 'profiles/my/';
  static const String _simulation = "profiles/answer/";
  static const String _sentMessageOther = 'message/';
  static const String _pastMatch = "message/past_match/";
  static const String _nickname_validation = "profiles/nickname-validation/";
  static const String _registrationPhone = "contact/";
  static const String _quit = "users/";

  // static const String
  MessageSentDto? messageSentDto;
  MessageUpdateDto? refuseDto;
  int? id;
  int? profile_id;
  Map<String, dynamic>? param;
  RegisterPart1Dto? registerPart1Dto;
  RegisterPart2Dto? registerPart2Dto;
  ContactsDto? contactsDto;
  SimulationDto? simulationDto;
  int? user_id;
  ApiController(
      {this.refuseDto,
      this.id,
      this.messageSentDto,
      this.param,
      this.registerPart1Dto,
      this.profile_id,
      this.registerPart2Dto,
      this.contactsDto,
      this.simulationDto,
      this.user_id});

  Future<Response> apiCategorize() async {
    try {
      await authorize();
      switch (T) {
        case QuitEvent:
          try {
            _response = await delete_Request(_quit, user_id!);
          } catch (e) {
            log(e.toString());
            log("ApiController -> QuitEvent");
          }
          return _response;

        case RegisterSimulationEvent:
          _response = await post_Request(_simulation, simulationDto!);
          return _response;

        case RegisterPhoneEvent:
          _response = await post_Request(_registrationPhone, contactsDto!);
          return _response;

        case LoadContactsEvent:
          _response = await get_Request(_registrationPhone);
          return _response;

        case NickNameValidEvent:
          //닉네임 유효성 판별
          _response =
              await get_Request_Include_param(_nickname_validation, param!);
          return _response;

        case ReceivedMessageLoadEvent:
          //받은 메세지
          _response = await get_Request(_messageRecived);
          return _response;

        case LoadMyProfileEvent:
          //내 프로필
          _response = await get_Request(_myprofile);
          return _response;

        case LoadOtherProfilesEvent:
          //프로필 조회
          _response = await get_Request_Include_path(_profile, id!);
          return _response;

        case LoadPastMatchEvent:
          //스쳐관 반쪽 조회
          _response = await get_Request(_pastMatch);
          return _response;

        case RegisterPart1Event:
          _response = await patch_Request(
              _profile, registerPart1Dto!.toJson(), profile_id!);
          return _response;

        case RegisterPart2Event:
          _response = await patch_Request(
              _profile, registerPart2Dto!.toJson(), profile_id!);
          return _response;

        case SentMessageLoadEvent:
          //보낸 메세지
          _response = await get_Request(_messageSent);
          return _response;

        case ReceivedMessagedRefuseEvent:
          Map<String, dynamic> body = {
            "content": "${refuseDto!.content}",
            "status": "refused"
          };
          //거절 이벤트
          _response = await patch_Request(_messageRefuse, body, refuseDto!.id);
          return _response;

        case DailyFourIntroduceBloc:
          //4명씩 소개
          _response = await get_Request(_todayProfiles);
          return _response;

        case SentEvent:
          //메세지 보내기
          _response =
              await post_Request(_sentMessageOther, messageSentDto as Object);
          return _response;
        default:
          throw Exception("예기치 못한 오류");
      }
    } catch (e) {
      print(e);
      throw Exception("ApiController -> accessToken 요청 오류");
    }
  }
}
