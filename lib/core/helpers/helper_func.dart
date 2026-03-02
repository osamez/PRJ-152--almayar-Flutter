import 'package:almeyar/core/utils/exports.dart';

double calculateGridChildAspectRatio({
  required BuildContext context,
  double sectionPadding = 0,
  double spacing = 0,
  required double cardHeight,
  required int crossAxisCount,
}) {
  double screenWidth = context.width;
  double gridSpacing = ((crossAxisCount - 1) * spacing);
  double cardWidth =
      (screenWidth - (sectionPadding * 2) - gridSpacing) / crossAxisCount;
  return cardWidth / cardHeight;
}
