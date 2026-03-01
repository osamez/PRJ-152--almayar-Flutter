part of '../../feature_imports.dart';

class ShipmentDetailsMediaItem {
  const ShipmentDetailsMediaItem({
    required this.fileName,
    required this.isImage,
  });

  final String fileName;
  final bool isImage;
}

class ShipmentDetailsMediaGrid extends StatelessWidget {
  const ShipmentDetailsMediaGrid({super.key, required this.items});

  final List<ShipmentDetailsMediaItem> items;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppSizes.w12,
      children: items.map((item) {
        return Expanded(child: ShipmentDetailsMediaCard(item: item));
      }).toList(),
    );
  }
}
