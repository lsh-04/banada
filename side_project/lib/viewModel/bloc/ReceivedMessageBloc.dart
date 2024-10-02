import 'package:bloc/bloc.dart';
import 'package:side_project/controller/ApiController.dart';
import './event/ReceivedMessageEvent.dart';
import './state/ReceivedMessageState.dart';
import 'package:side_project/repository/ReceivedMessageRepository.dart';

class ReceivedMessageBloc
    extends Bloc<ReceivedMessageEvent, ReceivedMessageState> {
  late final ReceivedMessageRepository repository;
  late ApiController apiController;
  ReceivedMessageBloc() : super(InitMessageState()) {
    repository = new ReceivedMessageRepository();

    //데이터 로드
    on<ReceivedMessageLoadEvent>((event, emit) async {
      try {
        emit(LoadingReceivedMessageState());
        await repository.getData();
        emit(LoadedReceivedMessageState(repository: repository));
      } catch (e) {
        print(e);
        emit(ErrorMessageState());
      }
    });

    //메세지 거절
    on<ReceivedMessagedRefuseEvent>((event, emit) async {
      //로딩 상태
      emit(LoadingReceivedMessageState());
      //제네릭 의존관계 주입
      apiController = new ApiController<ReceivedMessagedRefuseEvent>(
          refuseDto: event.messageUpdateDto);

      await apiController.apiCategorize();

      //받은 메세지 데이터 로드
      add(ReceivedMessageLoadEvent());
    });
  }
}
