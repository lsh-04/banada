import 'package:meta/meta.dart';
import 'package:side_project/core/data/PageList.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_project/login/LoginMain.dart';
import 'package:side_project/login/loginpage/LoginPage1_TOS.dart';
import 'package:side_project/login/loginpage/LoginPage2_ProfileAnnounce.dart';
import 'package:side_project/login/loginpage/LoginPage3_ProfileWrite1.dart';
import 'package:side_project/login/loginpage/LoginPage3_ProfileWrite2.dart';
import 'package:side_project/login/loginpage/LoginPage4_Image.dart';
import 'package:side_project/login/loginpage/LoginPageLast.dart';
import 'package:flutter/material.dart';
import 'package:side_project/login/simulations/SimulationMain.dart';
import 'package:side_project/login/simulations/SimulationPage.dart';
import 'package:side_project/view/MainPage.dart';
import 'package:side_project/viewModel/bloc/MyProfileBloc.dart';

@immutable
class LoginRoute {
  static final Map<PageList, Widget Function()> loginRoute = {};

  LoginRoute() {
    loginRoute.addAll({
      PageList.LoginMain: () => LoginMain(),
      PageList.LoginPage1_TOS: () => LoginPage1_TOS(),
      PageList.LoginPage2_ProfileAnnounce: () => LoginPage2_ProfileAnnounce(),
      PageList.LoginPage3_ProfileWrite1: () => LoginPage3_ProfileWrite1(),
      PageList.LoginPage3_ProfileWrite2: () => LoginPage3_ProfileWrite2(),
      PageList.LoginPage4_Image: () => LoginPage4_Image(),
      PageList.SimulationMain: () => SimulationMain(),
      PageList.SimulationPage: () => Builder(builder: (context) {
            return SimulationPage(
                currentpage: context
                    .read<MyProfileBloc>()
                    .state
                    .repository!
                    .data
                    .answers
                    .length);
          }),
      PageList.LoginPageLast: () => LoginPageLast(),
      PageList.Main: () => MainPage()
    });
  }

  Map<PageList, Widget Function()> getLoginRoute() {
    return LoginRoute.loginRoute;
  }
}
