import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highness_app/core/assets_data/assets_data.dart';
import 'package:highness_app/core/theme/app_color.dart';
import 'package:highness_app/view/screens/home_screen.dart';
import 'package:highness_app/view/widgets/custom_button.dart';

import '../../../generated/l10n.dart';
import '../app_layout_view/app_layout_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var lang=S.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AssetsData.splashBackImg,width: double.infinity,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 12,
                child: Center(
                  child: SvgPicture.asset(AssetsData.logoImg),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  spacing: MediaQuery.of(context).size.height*0.02,

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(lang.splash_head_title,style: Theme.of(context).textTheme.headlineLarge,),
                    Text(lang.splash_medium_title,style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.secondary
                    ),),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(AssetsData.splashDesign1),
                    CustomButton(text: S.of(context).get_started_button, onPressed:(){
                      Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context) => AppLayoutScreen(),), (Route<dynamic> route) => false);
                    } ),
                    SvgPicture.asset(AssetsData.splashArrowDesign),



                  ],
                ),
              ),
              Spacer()


            ],
          ),
        ],
      ),
    );
  }
}
