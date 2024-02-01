import 'package:flutter/material.dart';
import 'package:ten_twenty_task/routes/routes.dart';

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


  Widget clickListener({VoidCallback? click}){
    return GestureDetector(
      onTap: (){
        click!();
      },
      child: this,
    );
  }

}
