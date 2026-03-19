part of '../../feature_imports.dart';

class DepositRequestsViewBody extends StatelessWidget {
  const DepositRequestsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<int> depositRequests = <int>[123, 123, 123];

    return Column(
      children: [
        const CreateDepositRequestButton(),
        verticalSpace(AppSizes.h24),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsetsDirectional.all(1),
            itemBuilder: (context, index) {
              return DepositRequestCard(requestId: index);
            },
            separatorBuilder: (context, index) {
              if (index == 0) {
                return verticalSpace(AppSizes.h24);
              }
              if (index == 1) {
                return verticalSpace(AppSizes.h20);
              }
              return verticalSpace(AppSizes.h16);
            },
            itemCount: depositRequests.length + 2,
          ),
        ),
      ],
    );
  }
}
