part of '../../feature_imports.dart';

class AppInfoViewBody extends StatelessWidget {
  const AppInfoViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppInfoCubit, AppInfoState>(
      builder: (context, state) {
        return state.getAppInfoState.when(
          data: (content) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.w20,
                vertical: AppSizes.h24,
              ),
              child: Html(
                data: content,
                style: {
                  "body": Style(
                    fontSize: FontSize(16.sp),
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkSlate,
                    margin: Margins.zero,
                    padding: HtmlPaddings.zero,
                  ),
                },
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error:
              (error) => CustomErrorWidget(
                message: error.message ?? '',
                onPressed: () {
                  if (state.infoType != null) {
                    context.read<AppInfoCubit>().getAppInfo(state.infoType!);
                  }
                },
              ),
          initial: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
