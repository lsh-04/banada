import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:side_project/core/data/LoginRoute.dart';
import 'package:side_project/login/LoginMain.dart';
import 'package:side_project/view/MainPage.dart';
import 'package:side_project/view/loading/Loading.dart';
import 'package:side_project/view/message/registrationPhoneNumber/RegistrationPhoneNumberPage2.dart';
import 'package:side_project/view/message/registrationPhoneNumber/RegistrationPhoneNumberPage3.dart';
import 'package:side_project/viewModel/bloc/DailyFourIntroduceBloc.dart';
import 'package:side_project/viewModel/bloc/MyProfileBloc.dart';
import 'package:side_project/viewModel/bloc/NickNameValidBloc.dart';
import 'package:side_project/viewModel/bloc/OtherProfilesBloc.dart';
import 'package:side_project/viewModel/bloc/PastMatchBloc.dart';
import 'package:side_project/viewModel/bloc/ReceivedMessageBloc.dart';
import 'package:side_project/viewModel/bloc/RegisterBloc.dart';
import 'package:side_project/viewModel/bloc/SentMessageBloc.dart';
import 'package:side_project/viewModel/bloc/SimulationBloc.dart';
import 'package:side_project/viewModel/bloc/SplashBloc.dart';
import 'package:side_project/viewModel/bloc/TimeDailyFourIntroduceBloc.dart';
import 'package:side_project/viewModel/bloc/event/DailyFourIntroduceEvent.dart';
import 'package:side_project/viewModel/bloc/event/MyProfileEvent.dart';
import 'package:side_project/viewModel/bloc/event/PastMatchEvent.dart';
import 'package:side_project/viewModel/bloc/event/ReceivedMessageEvent.dart';
import 'package:side_project/viewModel/bloc/event/SentMessageEvent.dart';
import 'package:side_project/viewModel/bloc/state/MyProfileState.dart';
import 'package:side_project/viewModel/cubit/BottomNavigationBarCubit.dart';
import 'package:side_project/viewModel/cubit/ImageCubit.dart';
import 'package:side_project/viewModel/cubit/IntroduceCubit.dart';
import 'package:side_project/viewModel/cubit/JobCubit.dart';
import 'package:side_project/viewModel/cubit/MessageProfileCubit.dart';
import 'package:side_project/viewModel/cubit/PoliticsCubit.dart';
import 'package:side_project/viewModel/cubit/RegionCubit.dart';
import 'package:side_project/viewModel/cubit/ReligionCubit.dart';
import 'package:side_project/viewModel/cubit/SimulationChooseCubit.dart';
import 'package:side_project/login/splash/Splash.dart';
import 'package:side_project/login/webView/KakaoLoginWebView.dart';
import 'package:side_project/core/dump/Test.dart';
import 'package:side_project/view/home/DetailsProfile.dart';
import 'package:side_project/view/message/MessageProfile.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart' as getx;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  //로고 로딩 될때까지 기다림(스플래시)
  WidgetsFlutterBinding.ensureInitialized();
  await rootBundle.load('assets/image/logo.png');
  runApp(ResponsiveSizer(builder: (context, orientation, screenType) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MyProfileBloc()),
        BlocProvider(
          create: (context) => SimulationBloc(),
        ),
        BlocProvider(
            create: (context) =>
                RegisterBloc(myProfileBloc: context.read<MyProfileBloc>())),
        BlocProvider(
          lazy: false,
          create: (context) => SplashBloc(
              simulationBloc: context.read<SimulationBloc>(),
              registerBloc: context.read<RegisterBloc>()),
        ),
        BlocProvider(create: (context) => PastMatchBloc()),
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
        BlocProvider(
          create: (context) => BottomNavigationBarCubit(),
        ),
        BlocProvider(create: (context) => NickNameValidBloc()),
      ],
      //main
      child: getx.GetMaterialApp(
        home: BlocBuilder<SplashBloc, SplashState>(builder: (context, state) {
          print(state);
          if (state is LoadedBlocState) {
            return BlocBuilder<RegisterBloc, RegisterState>(
                builder: (context, registerstate) {
              if (registerstate is RenewRegisterState) {
                log("로그인 main 6. RegisterStatusEvent 완료");
                return BlocBuilder<MyProfileBloc, MyProfileState>(
                    builder: (context, myprofilestate) {
                  if (myprofilestate is LoadedMyProfileState) {
                    print("로그인 main final. LoadMyProfileEvent 완료");
                    context
                        .read<ReceivedMessageBloc>()
                        .add(ReceivedMessageLoadEvent());
                    context.read<SentMessageBloc>().add(SentMessageLoadEvent());
                    context
                        .read<DailyFourIntroduceBloc>()
                        .add(LoadDailyFourIntroduceEvent());
                    context.read<PastMatchBloc>().add(LoadPastMatchEvent());
                  }
                  LoginRoute loginRoute = new LoginRoute();
                  return loginRoute.getLoginRoute()[registerstate.page]!();
                });
              } else if (registerstate is ErrorRegisterState) {
                return LoginMain();
              } else {
                log("로그인 main. RegisterState 기다리는 중");
                return BlocListener<RegisterBloc, RegisterState>(
                    listener: (context, state) {
                      if (!(state is RenewRegisterState ||
                          state is ErrorRegisterState)) {
                        showDialog(
                          barrierDismissible: false,
                          barrierColor: Colors.black54,
                          context: context,
                          builder: (BuildContext context) {
                            return Loading();
                          },
                        );
                      }
                    },
                    child: LoginMain());
              }
            });
          } else {
            return Splash();
          }
        }),

        //라우트 관리
        getPages: [
          getx.GetPage(
              name: "/MessageProfile",
              page: () => MessageProfile(),
              transition: getx.Transition.noTransition),
          getx.GetPage(
              name: "/DetailsProfile",
              page: () => DetailsProfile(),
              transition: getx.Transition.noTransition),
          getx.GetPage(
              name: "/kakaoLogin",
              page: () => KakaoLoginWebView(),
              transition: getx.Transition.noTransition),
          getx.GetPage(
              page: () => Builder(
                    builder: (context) {
                      final myProfileBloc = context.read<MyProfileBloc>();
                      return myProfileBloc.state.repository!.contacts.isEmpty
                          ? RegistrationPhoneNumberPage2()
                          : RegistrationPhoneNumberPage3();
                    },
                  ),
              name: "/registerPhone",
              transition: getx.Transition.noTransition)
        ],
      ),
    );
    //점검
  }));
}
