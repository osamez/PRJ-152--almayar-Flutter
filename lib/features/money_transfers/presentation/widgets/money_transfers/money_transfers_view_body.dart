part of '../../feature_imports.dart';

class MoneyTransfersViewBody extends StatefulWidget {
  const MoneyTransfersViewBody({super.key});

  @override
  State<MoneyTransfersViewBody> createState() => _MoneyTransfersViewBodyState();
}

class _MoneyTransfersViewBodyState extends State<MoneyTransfersViewBody> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MoneyTransfersTabBar(
          selectedIndex: _selectedTabIndex,
          onTabChanged: (int index) {
            setState(() => _selectedTabIndex = index);
          },
        ),
        verticalSpace(AppSizes.h20),
        const MoneyTransfersAddButton(),
        verticalSpace(AppSizes.h20),
        Expanded(
          child: ListView.separated(
            itemCount: 4,
            separatorBuilder: (_, _) => verticalSpace(AppSizes.h16),
            itemBuilder: (BuildContext context, int index) {
              return MoneyTransferCard(
                phoneNumber: '31493548089',
                date: '2026-01-01',
                statusLabel: LocaleKeys.money_transfers_deducted.tr(),
                statusColor: AppColors.orange,
                invoiceValue: '\$2000',
                paymentCurrency: 'اليوان الصيني',
                dueAmount: '\$2050',
                onTap: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}
