import 'package:almeyar/core/utils/exports.dart';
import 'package:almeyar/core/widgets/media_card.dart';

class MediaItem {
  const MediaItem({required this.fileName, required this.isImage});

  final String fileName;
  final bool isImage;
}

class MediaGrid extends StatelessWidget {
  const MediaGrid({super.key, required this.items});

  final List<MediaItem> items;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppSizes.w12,
      children: items.map((item) {
        return Expanded(child: MediaCard(item: item));
      }).toList(),
    );
  }
}
