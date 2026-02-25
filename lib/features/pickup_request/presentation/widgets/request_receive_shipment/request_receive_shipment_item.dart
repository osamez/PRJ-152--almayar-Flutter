part of '../../feature_imports.dart';

class RequestReceiveShipmentItem extends StatelessWidget {
  const RequestReceiveShipmentItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.onTap,
    required this.subTitle,
    required this.prohibitedOnTap,
  });

  final String imagePath;
  final String title;
  final String description;
  final VoidCallback onTap;
  final String subTitle;
  final VoidCallback prohibitedOnTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShipmentImage(
          imagePath: imagePath,
          title: title,
          description: description,
          onTap: onTap,
        ),
        verticalSpace(AppSizes.h10),
        ProhibitedCard(subTitle: subTitle, onTap: prohibitedOnTap),
      ],
    );
  }
}
