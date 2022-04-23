import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonAtom extends StatelessWidget{
  final String title;
  final VoidCallback callback;
  final double? margin;

  const ButtonAtom({Key? key,required this.title,required this.callback,this.margin}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return InkWell(
     onTap: () {
       callback();
     },
     child: Container(
       margin:  EdgeInsets.all(margin??0).r,
       alignment: Alignment.center,
       width: double.infinity,
       height: 40.h,
       decoration: BoxDecoration(
           color: Theme.of(context).primaryColor,
           borderRadius: BorderRadius.circular(40)),
       child: Text(
        title,
         style: Theme.of(context).textTheme.bodyText1,
       ),
     ),
   );
  }

}