import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/models/message_model.dart';
import 'package:almeyar/core/models/wallet_model.dart';
import 'package:almeyar/features/purchase_orders/data/models/add_purchase_request_model.dart';
import 'package:almeyar/features/purchase_orders/data/models/purchase_orders_response_model.dart';
import 'package:almeyar/features/purchase_orders/data/models/shopping_sites_response_model.dart';

abstract class PurchaseOrdersDataSource {
  Future<PurchaseOrdersResponseModel> getPurchaseRequests(
    int? page,
    int? status,
    String? code,
  );

  Future<MessageModel> addPurchaseRequest(AddPurchaseRequestModel request);

  Future<BaseResponse<List<WalletModel>>> getMyWallets();

  Future<BaseResponse<ShoppingSitesResponseModel>> getShoppingSites(
    String? name,
    int? page,
  );
}
