import 'dart:io';
import 'package:almeyar/core/helpers/app_snack_bar.dart';
import 'package:open_filex/open_filex.dart';

import 'exports.dart';

class AppDialogs {
  AppDialogs._();

  static Future<void> _openMyLocalFile(
    String localFilePath,
    BuildContext context,
  ) async {
    final result = await OpenFilex.open(localFilePath);
    if (result.type == ResultType.done) {
      AppLogger.info('تم فتح الملف بنجاح');
    } else if (result.type == ResultType.noAppToOpen) {
      if (!context.mounted) return;
      showAppSnackbar(
        context: context,
        type: SnackbarType.error,
        description: 'لا يوجد تطبيق لفتح الملف',
      );
    } else {
      if (!context.mounted) return;
      showAppSnackbar(
        context: context,
        type: SnackbarType.error,
        description: 'حدث خطأ أثناء فتح الملف',
      );
    }
  }

  static Future<void> openFile(File file, BuildContext context) async {
    await _openMyLocalFile(file.path, context);
  }

  static void showImageViewerDialog({
    required BuildContext context,
    String? imageUrl,
    File? imageFile,
    Widget? customWidget,
  }) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
        child: Stack(
          children: [
            Center(
              child: InteractiveViewer(
                child:
                    customWidget ??
                    (imageFile != null
                        ? Image.file(imageFile, fit: BoxFit.contain)
                        : CustomCachedImage(
                            imageUrl: imageUrl,
                            fit: BoxFit.contain,
                          )),
              ),
            ),
            Positioned(
              top: AppSizes.h40,
              right: AppSizes.w16,
              child: IconButton(
                icon: const Icon(Icons.close, color: AppColors.white, size: 30),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
