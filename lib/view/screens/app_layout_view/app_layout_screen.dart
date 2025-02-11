import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highness_app/core/theme/app_color.dart';
import 'package:highness_app/viewmodel/app_layout_cubit/app_layout_cubit.dart';

import '../../../core/assets_data/assets_data.dart';
import '../../../generated/l10n.dart';

class AppLayoutScreen extends StatelessWidget {
  const AppLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var brightness = Theme.of(context).brightness;
    bool isDarkMode = brightness == Brightness.dark;
print(brightness);
var lang = S.of(context);
var cubit= context.read<AppLayoutCubit>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: SvgPicture.asset(AssetsData.logoImg,width: 15,height: 37,),
      ),
        bottomNavigationBar:Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(
              colors: [
                Color(0xFF3D4463),
                Color(0xFF1D253B),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            border: Border.all(color: Color(0xff707070)),
          ),
          child: BlocBuilder<AppLayoutCubit, AppLayoutState>(
  builder: (context, state) {
    return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 10.0,
            backgroundColor: isDarkMode ? Color(0xff6C77A1).withValues(alpha: 0.1) : Colors.white,
            selectedItemColor:Colors.white ,
            onTap: (index)
            {
              print(index);
              cubit.changeTaps(index);
            },
            items: [
              BottomNavigationBarItem(icon: SvgPicture.asset(AssetsData.homeIcon, width: 20, height: 20), label:lang.home ),
              BottomNavigationBarItem(icon: SvgPicture.asset(AssetsData.homeIcon, width: 20, height: 20), label: lang.Market_watch),
              BottomNavigationBarItem(icon: SvgPicture.asset(AssetsData.homeIcon, width: 20, height: 20), label: lang.support),
              BottomNavigationBarItem(icon: SvgPicture.asset(AssetsData.homeIcon, width: 20, height: 20), label: lang.Setting),

            ],
            currentIndex: cubit.tapIndex,
          );
  },
),
        )
      ,
      body:BlocBuilder<AppLayoutCubit, AppLayoutState>(
          builder: (context, state){
        return cubit.screens[cubit.tapIndex];
      }),
    );
  }
}