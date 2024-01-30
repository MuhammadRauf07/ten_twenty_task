import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:freud_ai/configs/helper/screen_util.dart';
import 'package:freud_ai/routes/routes.dart';

extension Extension on Widget {
  Widget centralized() {
    return Center(
      child: this,
    );
  }

  Widget expanded() {
    return Expanded(
      child: this,
    );
  }

  Widget goBack() {
    return GestureDetector(
      onTap: () {
        Navigate.pop();
      },
      child: this,
    );
  }


  Widget clickListener({VoidCallback? voidCallback}){
    return GestureDetector(
      onTap: (){
        voidCallback!();
      },
      child: this,
    );
  }



  ///
  Widget animatedListView({List<dynamic>? list}) {
    return AnimationLimiter(
      child: ListView.builder(
        itemCount: list!.length,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 800),
            child: SlideAnimation(
              horizontalOffset: 20,
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 800),
              child: FadeInAnimation(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: this,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
