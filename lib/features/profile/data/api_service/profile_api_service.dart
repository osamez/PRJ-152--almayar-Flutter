import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/network/api_constants.dart';
import 'package:almeyar/features/profile/data/models/gift_card_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_api_service.g.dart';

@RestApi()
abstract class ProfileApiService {
  factory ProfileApiService(Dio dio, {String baseUrl}) = _ProfileApiService;

  @GET(ApiConstants.giftCards)
  Future<BaseResponse<List<GiftCardModel>>> getGiftCards();
}
