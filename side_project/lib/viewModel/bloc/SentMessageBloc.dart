import 'package:bloc/bloc.dart';
import 'package:side_project/controller/ApiController.dart';
import 'package:side_project/repository/SentMessageRepository.dart';
import './state/SentMessageState.dart';
import './event/SentMessageEvent.dart';
/**
 *  이 클래스를 만드는 이유
 *  이전 값을 저장 할 수 있는 경로가 없음.
 *  Sharedpreference는 효과적인 방법이 아님 state를 저장했다가 넘기는 게 방법이 될 수는 없음..
 */

class SentMessageBloc extends Bloc<SentMessageEvent, SentMessageState> {
  late ApiController apiController;
  late final SentMessageRepository repository;
  SentMessageBloc() : super(InitSentMessageState()) {
    repository = new SentMessageRepository();

    //보낸 메세지 - 탭 할 경우 로드
    on<SentMessageLoadEvent>((event, emit) async {
      apiController = new ApiController<SentMessageLoadEvent>();

      //로딩상태
      emit(LoadingSentMessageState());

      try {
        emit(LoadingSentMessageState());
        await repository.getData();
        emit(LoadedSentMessageState(repository: repository));
      } catch (e) {
        print(e);
        emit(ErrorMessageState());
      }
    });

    on<SentEvent>((event, emit) {
      try {
        apiController =
            new ApiController<SentEvent>(messageSentDto: event.sentDto);
        apiController.apiCategorize();
      } catch (e) {
        print(e);
        throw Exception("api 요청 오류");
      }
    });
  }
}
