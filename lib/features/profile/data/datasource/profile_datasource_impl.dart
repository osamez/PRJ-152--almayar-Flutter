import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/features/profile/data/api_service/profile_api_service.dart';
import 'package:almeyar/features/profile/data/datasource/profile_datasource.dart';
import 'package:almeyar/features/profile/data/models/gift_card_model.dart';

class ProfileDataSourceImpl implements ProfileDataSource {
  final ProfileApiService _apiService;

  const ProfileDataSourceImpl(this._apiService);

  @override
  Future<BaseResponse<List<GiftCardModel>>> getGiftCards() async {
    return await _apiService.getGiftCards();
  }
}
