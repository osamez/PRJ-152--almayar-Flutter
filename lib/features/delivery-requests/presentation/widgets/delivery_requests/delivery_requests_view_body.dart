part of '../../feature_imports.dart';

class DeliveryRequestsViewBody extends StatefulWidget {
  const DeliveryRequestsViewBody({super.key});

  @override
  State<DeliveryRequestsViewBody> createState() =>
      _DeliveryRequestsViewBodyState();
}

class _DeliveryRequestsViewBodyState extends State<DeliveryRequestsViewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DeliveryRequestsSearchBar(),
        verticalSpace(AppSizes.h12),
        const DeliveryTypeTabs(),
        verticalSpace(AppSizes.h20),
        const DeliveryRequestsHeader(resultCount: 3),
        verticalSpace(AppSizes.h20),
        Expanded(
          child: ListView.separated(
            itemCount: 3,
            separatorBuilder: (_, _) => verticalSpace(AppSizes.h16),
            itemBuilder: (BuildContext context, int index) {
              final bool isDelivery = index == 0 || index == 2;
              final bool isCompleted = index == 1;
              return DeliveryRequestCard(
                orderNumber: '31493548089',
                date: '2026-01-01',
                isDeliveryOrder: isDelivery,
                isCompleted: isCompleted,
                isPaid: isCompleted,
                address:
                    '\u0637\u0631\u0627\u0628\u0644\u0633\u060c \u0627\u0644\u0645\u062f\u064a\u0646\u0629 \u0627\u0644\u0633\u064a\u0627\u062d\u064a\u0629\u060c \u0634\u0627\u0631\u0639 \u0627\u0644\u062e\u0648\u064a\u0644\u062f\u064a',
                branch:
                    '\u0627\u0644\u0645\u0642\u0631 \u0627\u0644\u0631\u0626\u064a\u0633\u064a - \u0637\u0631\u0627\u0628\u0644\u0633',
                deliveryDate: '2026-01-29 05:01 \u0645',
                boxesCount: '2002',
                orderValue: '\$480',
                deliveryCost: isDelivery
                    ? '80 \u062f.\u0644'
                    : '0 \u062f.\u0644',
                onTap: () {
                  context.pushNamed(Routes.deliveryRequestsDetails);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
