import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    Key? key,
    required this.onTap,
    required this.image,
  }) : super(key: key);

  final VoidCallback onTap;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12, width: 1.5),
      ),
      child: SizedBox(
        width: 180,
        child: Image.network(image, fit: BoxFit.fitHeight),
      ),
    );
  }
}

// Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       child: DecoratedBox(
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.black12, width: 1.5),
//           borderRadius: BorderRadius.circular(5),
//         ),
//         child: Container(
//         padding: EdgeInsets.all(8),
//           width: 180,
//           child: Image.network(image, fit: BoxFit.fitHeight),
//         ),
//       ),
//     );
