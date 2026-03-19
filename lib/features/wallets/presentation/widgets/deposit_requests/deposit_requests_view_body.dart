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
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return DepositRequestCard(requestId: depositRequests[index]);
            },
            separatorBuilder: (context, index) {
              return verticalSpace(AppSizes.h16);
            },
            itemCount: depositRequests.length,
          ),
        ),
      ],
    );
  }
}
