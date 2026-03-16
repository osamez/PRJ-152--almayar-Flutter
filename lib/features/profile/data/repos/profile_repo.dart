import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/network/result.dart';
import 'package:almeyar/features/profile/data/models/gift_card_model.dart';

abstract class ProfileRepo {
  Future<Result<BaseResponse<List<GiftCardModel>>>> getGiftCards();
}
