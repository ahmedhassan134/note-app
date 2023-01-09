import 'package:flutter/material.dart';
class CustomAppBarWidget extends StatelessWidget {
 CustomAppBarWidget({Key? key,required this.title,required this.icon,this.onPressed}) : super(key: key);
final String title;
final IconData icon;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,style: const TextStyle(color: Colors.white,fontSize: 28),),
        const Spacer(),
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(.5),
              borderRadius: BorderRadius.circular(16)
          ),
          child: Center(
            child: IconButton(
              onPressed: onPressed,
              icon: Icon
                (icon,color: Colors.white,size: 32,),
            ),
          ),
        )
      ],
    );
  }
}