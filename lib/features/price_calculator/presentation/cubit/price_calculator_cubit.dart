import 'package:almeyar/core/models/app_branch_model.dart';
import 'package:almeyar/core/models/shipment_category_model.dart';
import 'package:almeyar/core/models/shipment_content_model.dart';
import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/network/api_error_model.dart';
import 'package:almeyar/core/network/result.dart';
import 'package:almeyar/core/utils/async.dart';
import 'package:almeyar/core/utils/exports.dart';
import 'package:almeyar/core/utils/result_extensions.dart';
import 'package:almeyar/features/price_calculator/data/models/price_calculator_request_model.dart';
import 'package:almeyar/features/price_calculator/data/models/price_calculator_response_model.dart';
import 'package:almeyar/features/price_calculator/data/repositories/price_calculator_repo.dart';

part 'price_calculator_state.dart';

class PriceCalculatorCubit extends Cubit<PriceCalculatorState> {
  final PriceCalculatorRepo _repo;

  PriceCalculatorCubit(this._repo) : super(const PriceCalculatorState());

  Future<void> loadInitialData() async {
    emit(
      state.copyWith(
        receivingBranches: const AsyncLoading(),
        deliveryBranches: const AsyncLoading(),
        shipmentCategories: const AsyncLoading(),
      ),
    );

    final results = await Future.wait([
      _repo.getReceivingBranches(),
      _repo.getDeliveryBranches(),
      _repo.getShipmentCategories(),
    ]);

    final receivingBranchesResult =
        results[0] as Result<BaseResponse<List<AppBranchModel>>>;
    final deliveryBranchesResult =
        results[1] as Result<BaseResponse<List<AppBranchModel>>>;
    final shipmentCategoriesResult =
        results[2] as Result<BaseResponse<List<ShipmentCategoryModel>>>;

    emit(
      state.copyWith(
        receivingBranches: receivingBranchesResult.toAsyncUnwrapped(),
        deliveryBranches: deliveryBranchesResult.toAsyncUnwrapped(),
        shipmentCategories: shipmentCategoriesResult.toAsyncUnwrapped(),
      ),
    );
  }

  void updateShipmentType(String type) {
    emit(
      state.copyWith(
        shipmentType: type,
        flightType:
            'slow', // Reset flight type to slow when shipment type changes
      ),
    );
  }

  void updateFlightType(String type) {
    emit(state.copyWith(flightType: type));
  }

  void updateReceivingBranch(AppBranchModel? branch) {
    emit(state.copyWith(selectedReceivingBranch: branch));
  }

  void updateDeliveryBranch(AppBranchModel? branch) {
    emit(state.copyWith(selectedDeliveryBranch: branch));
  }

  void updateCategory(ShipmentCategoryModel? category) {
    emit(state.copyWith(selectedCategory: category));
  }

  void updateContent(ShipmentContentModel? content) {
    emit(state.copyWith(selectedContent: content));
  }

  void updateWeight(String weight) {
    emit(state.copyWith(weight: weight));
  }

  void updateSize(String size) {
    emit(state.copyWith(size: size));
  }

  Future<void> calculatePrice() async {
    emit(state.copyWith(calculationResult: const AsyncLoading()));

    final result = await _repo.calculateShipmentPrice(
      PriceCalculatorRequestModel(
        receivingBranchId: state.selectedReceivingBranch?.id?.toString() ?? '',
        deliveryBranchId: state.selectedDeliveryBranch?.id?.toString() ?? '',
        categoryId: state.selectedCategory?.id?.toString() ?? '',
        shipmentContentId: '',
        shipmentType: state.shipmentType,
        flightType: state.flightType,
        weight: state.weight,
        size: state.size,
      ),
    );

    emit(state.copyWith(calculationResult: result.toAsyncUnwrapped()));
  }
}
