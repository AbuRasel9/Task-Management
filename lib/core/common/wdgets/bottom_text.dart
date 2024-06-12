import 'package:flutter/material.dart';

class BottomText extends StatelessWidget {
  //fist text is previous text in button text
  final String firstText;

  //onTap is button ontap function
  final VoidCallback onTap;

  //button text is button text
  final String buttonText;

  const BottomText({
    super.key,
    required this.onTap,
    required this.buttonText,
    required this.firstText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //text
        Text(
          firstText,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700),
        ),
        TextButton(
            onPressed: onTap,
            child: Text(
              buttonText,
              style: const TextStyle(
                fontSize: 18,
                  color: Color.fromRGBO(33, 191, 115, 100),
                  fontWeight: FontWeight.w700),
            ))
      ],
    );
  }
}
