import 'package:swimmast_movil/shared/constants.dart';

class SwimmastCard extends StatelessWidget {
  final Color? color;
  final Widget child;
  final double? height;
  final EdgeInsets? margin;
  const SwimmastCard(
      {super.key, required this.child, this.color, this.height, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      
        height: height ?? 80,
        // padding: const EdgeInsets.all(10),
        margin: margin ?? const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              width: 16,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  color: color ?? swimmastBlue),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(child: child),
          ],
        ));
  }
}
