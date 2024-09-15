import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:side_project/bloc/DailyFourIntroduceBloc.dart';
import 'package:side_project/bloc/MyProfileBloc.dart';
import 'package:side_project/bloc/OtherProfilesBloc.dart';
import 'package:side_project/bloc/ReceivedMessageBloc.dart';
import 'package:side_project/bloc/SentMessageBloc.dart';
import 'package:side_project/bloc/TimeDailyFourIntroduceBloc.dart';
import 'package:side_project/bloc/event/DailyFourIntroduceEvent.dart';
import 'package:side_project/bloc/event/MyProfileEvent.dart';
import 'package:side_project/bloc/event/ReceivedMessageEvent.dart';
import 'package:side_project/bloc/event/SentMessageEvent.dart';
import 'package:side_project/cubit/BottomNavigationBarCubit.dart';
import 'package:side_project/cubit/MessageProfileCubit.dart';
import 'package:side_project/login/LoginMain.dart';
import 'package:side_project/login/bloc/LoginBloc.dart';
import 'package:side_project/login/bloc/SimulationBloc.dart';
import 'package:side_project/login/bloc/SplashBloc.dart';
import 'package:side_project/login/cubit/ImageCubit.dart';
import 'package:side_project/login/cubit/IntroduceCubit.dart';
import 'package:side_project/login/cubit/JobCubit.dart';
import 'package:side_project/login/cubit/PoliticsCubit.dart';
import 'package:side_project/login/cubit/RegionCubit.dart';
import 'package:side_project/login/cubit/ReligionCubit.dart';
import 'package:side_project/login/cubit/SimulationChooseCubit.dart';
import 'package:side_project/login/introduce/IntroducePage.dart';
import 'package:side_project/login/simulations/SimulationMain.dart';
import 'package:side_project/login/splash/Splash.dart';
import 'package:side_project/test/Test.dart';
import 'package:side_project/view/etc/Preparing.dart';
import 'package:side_project/view/home/DetailsProfile.dart';
import 'package:side_project/view/message/MessageProfile.dart';
import 'home.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart' as getx;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

void main() async {
  //로고 로딩 될때까지 기다림(스플래시)
  WidgetsFlutterBinding.ensureInitialized();
  await rootBundle.load('assets/image/logo.png');
  KakaoSdk.init(
      nativeAppKey: '75fd1ed1cfb70be8251a1f70fd22ed2b',
      javaScriptAppKey: 'ad36e43a17b490d106346aea6f0e9637');
  runApp(ResponsiveSizer(builder: (context, orientation, screenType) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SimulationBloc(),
        ),
        BlocProvider(
          lazy: false,
          create: (context) =>
              SplashBloc(simulationBloc: context.read<SimulationBloc>()),
        ),
        BlocProvider(create: (context) => MyProfileBloc()),
        BlocProvider(create: (context) => ReceivedMessageBloc()),
        BlocProvider(create: (context) => SentMessageBloc()),
        BlocProvider(create: (context) => DailyFourIntroduceBloc()),
        BlocProvider(create: (context) => OtherProfilesBloc()),
        BlocProvider(create: (context) => TimeDailyFourIntroduceBloc()),
        BlocProvider(create: (context) => MessageProfileCubit()),
        BlocProvider(
          create: (context) => RegionCubit(),
        ),
        BlocProvider(
          create: (context) => ReligionCubit(),
        ),
        BlocProvider(
          create: (context) => JoBCubit(),
        ),
        BlocProvider(
          create: (context) => PoliticsCubit(),
        ),
        BlocProvider(
          create: (context) => ImageCubit(),
        ),
        BlocProvider(
          create: (context) => SimulationChooseCubit(),
        ),
        BlocProvider(
          create: (context) => IntroduceCubit(),
        ),
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(
          create: (context) => BottomNavigationBarCubit(),
        ),
      ],
      //main
      child: getx.GetMaterialApp(
        home: BlocBuilder<SplashBloc, SplashState>(builder: (context, state) {
          if (kIsWeb) {
            context.read<MyProfileBloc>().add(LoadMyProfileEvent());
            context.read<ReceivedMessageBloc>().add(ReceivedMessageLoadEvent());
            context.read<SentMessageBloc>().add(SentMessageLoadEvent());
            context
                .read<DailyFourIntroduceBloc>()
                .add(LoadDailyFourIntroduceEvent());
            return Test();
          }
          print(state);
          if (state is LoadedBlocState) {
            //인증 후 데이터 요청
            context.read<MyProfileBloc>().add(LoadMyProfileEvent());
            context.read<ReceivedMessageBloc>().add(ReceivedMessageLoadEvent());
            context.read<SentMessageBloc>().add(SentMessageLoadEvent());
            context
                .read<DailyFourIntroduceBloc>()
                .add(LoadDailyFourIntroduceEvent());
            return Test();
          } else {
            return Splash();
          }
        }),

        //라우트 관리
        getPages: [
          getx.GetPage(
              name: '/MessageProfile',
              page: () => MessageProfile(),
              transition: getx.Transition.noTransition),
          getx.GetPage(
              name: '/DetailsProfile',
              page: () => DetailsProfile(),
              transition: getx.Transition.noTransition),
        ],
      ),
    );
    //점검
  }));
}
