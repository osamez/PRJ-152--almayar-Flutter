part of '../../feature_imports.dart';

class PurchaseOrdersViewBody extends StatelessWidget {
  const PurchaseOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PurchaseOrdersSearchBar(),
        verticalSpace(AppSizes.h12),
        const PurchaseOrdersAddButton(),
        verticalSpace(AppSizes.h20),
        const PurchaseOrdersFilterHeader(resultCount: 3),
        verticalSpace(AppSizes.h20),
        Expanded(
          child: ListView.separated(
            itemCount: 3,
            separatorBuilder: (_, _) => verticalSpace(AppSizes.h16),
            itemBuilder: (BuildContext context, int index) {
              return PurchaseOrderCard(
                orderNumber: 'RH2053',
                creationDate: 'الاثنين, 02 فبراير 2026. 13:20:31',
                purchaseDate: 'الاثنين, 02 فبراير 2026. 13:20:31',
                orderValue: '\$300',
                amountPaid: '2100 د.ل',
                website: 'Ali Express',
                status: LocaleKeys.purchase_orders_under_review.tr(),
                onTap: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}
