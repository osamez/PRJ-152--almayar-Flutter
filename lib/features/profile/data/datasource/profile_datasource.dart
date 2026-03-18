import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/features/profile/data/models/gift_card_model.dart';
import 'package:almeyar/features/profile/data/models/profile_model.dart';

abstract class ProfileDataSource {
  Future<BaseResponse<List<GiftCardModel>>> getGiftCards();

  Future<BaseResponse<ProfileModel>> getProfile();
}
