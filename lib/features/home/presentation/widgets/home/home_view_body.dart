import 'package:almeyar/features/home/presentation/feature_imports.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          const HomeBanner(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.w36),
            margin: EdgeInsets.only(top: 0.32.sh, bottom: AppSizes.h50),
            child: Column(
              children: [
                HomeHorizontalCard(
                  color1: AppColors.lightOrange,
                  color2: AppColors.orange,
                  title: LocaleKeys.home_track_shipments,
                  subtitle: LocaleKeys.home_track_shipments_desc,
                  svgIcon: AppAssets.svgShippingAddresses,
                  onTap: () {
                    context.push(Routes.shipmentAddresses);
                  },
                ),
                verticalSpace(AppSizes.h10),
                const HomeHorizontalCard(
                  color1: AppColors.lightViolet,
                  color2: AppColors.deepViolet,
                  title: LocaleKeys.home_request_shipment,
                  subtitle: LocaleKeys.home_request_shipment_desc,
                  svgIcon: AppAssets.svgReciveOrder,
                ),
                verticalSpace(AppSizes.h10),
                const HomeHorizontalCard(
                  color1: AppColors.white,
                  color2: AppColors.white,
                  showShadow: true,
                  title: LocaleKeys.home_request_shipment,
                  titleColor: AppColors.deepViolet,
                  subtitleColor: AppColors.darkSlate,
                  iconBackgroundColor: AppColors.grey97,
                  arrowBackgroundColor: AppColors.grey98,
                  subtitle: LocaleKeys.home_request_shipment_desc,
                  svgIcon: AppAssets.svgReciveOrder,
                ),
                verticalSpace(AppSizes.h10),
                Row(
                  spacing: AppSizes.w10,
                  children: const [
                    Expanded(
                      child: HomeVerticalCard(
                        title: LocaleKeys.home_delivery_orders,
                        svgIcon: AppAssets.svgTruck,
                      ),
                    ),
                    Expanded(
                      child: HomeVerticalCard(
                        title: LocaleKeys.home_price_calculator,
                        svgIcon: AppAssets.svgCalculator,
                      ),
                    ),
                  ],
                ),
                verticalSpace(AppSizes.h32),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomeBannerTwoImage(
                      title: LocaleKeys.home_shopping_service,
                      subtitle: LocaleKeys.home_shopping_service_desc,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: PayServiceCard(
                            title: LocaleKeys.home_shopping_websites,
                            subtitle: LocaleKeys.home_shopping_websites_desc,
                            svgIcon: AppAssets.svgBasket,
                            titleColor: AppColors.grey19,
                            subtitleColor: AppColors.grey42,
                            iconBackgroundColor: const Color(
                              0xffff8c42,
                            ).withValues(alpha: 0.15),
                            arrowBackgroundColor: AppColors.grey98,
                            arrowColor: AppColors.orange,
                            backgroundColor: AppColors.white,
                            onTap: () {},
                          ),
                        ),
                        Expanded(
                          child: PayServiceCard(
                            title: LocaleKeys.home_purchase_orders,
                            subtitle: LocaleKeys.home_purchase_orders_desc,
                            svgIcon: AppAssets.svgMoney,
                            titleColor: AppColors.white,
                            subtitleColor: AppColors.offWhite,
                            iconBackgroundColor: AppColors.offWhite,
                            arrowBackgroundColor: AppColors.grey98,
                            arrowColor: AppColors.deepViolet,
                            backgroundColor: AppColors.deepViolet,
                            isLeftRadius: true,
                            isGradient: true,
                            gradientColor: AppColors.lightViolet,
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(AppSizes.h32),
                    const MoneyTransfers(
                      title: LocaleKeys.home_financial_transfers,
                      subtitle: LocaleKeys.home_financial_transfers_desc,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
