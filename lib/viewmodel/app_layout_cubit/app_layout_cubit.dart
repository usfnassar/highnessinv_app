import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:highness_app/view/screens/home_screen.dart';
import 'package:meta/meta.dart';

import '../../view/screens/home_screen2.dart';

part 'app_layout_state.dart';

class AppLayoutCubit extends Cubit<AppLayoutState> {
  AppLayoutCubit() : super(AppLayoutInitial());
  int tapIndex=0;
  List <Widget> screens=[
    HomeScreen(),
    HomeScreen2(),
    HomeScreen(),
    HomeScreen(),
  ];
  void changeTaps(int tapIndex){
    this.tapIndex=tapIndex;
    emit(AppLayoutChangeTapBarState());
  }
}
