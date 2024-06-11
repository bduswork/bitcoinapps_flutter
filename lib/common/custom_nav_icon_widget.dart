import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavIconWidget extends StatelessWidget {
  final String navIconImage;
  final Color? color;
  final double size;

  const CustomNavIconWidget({
    super.key,
    required this.navIconImage,
    this.color,
    this.size = 24.0,  // default size
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      navIconImage,
      width: size,
      height: size,
      colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
    );
  }
}




// import 'package:flutter/material.dart';

// class CustomNavIconWidget extends StatelessWidget {
//   final String navIconImage;
//   const CustomNavIconWidget({super.key, required this.navIconImage});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(3.0),
//       child: SizedBox(
//           height: 35,
//           child: Padding(
//             padding: const EdgeInsets.all(4.0),
//             child: Image.asset(navIconImage, height: 24, width: 24, fit: BoxFit.contain,),
//           )
//       ),
//     );
//   }
// }