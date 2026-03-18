import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/models/message_model.dart';
import 'package:almeyar/core/network/api_constants.dart';
import 'package:almeyar/features/profile/data/models/gift_card_model.dart';
import 'package:almeyar/features/profile/data/models/profile_model.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_api_service.g.dart';

@RestApi()
abstract class ProfileApiService {
  factory ProfileApiService(Dio dio, {String baseUrl}) = _ProfileApiService;

  @GET(ApiConstants.giftCards)
  Future<BaseResponse<List<GiftCardModel>>> getGiftCards();

  @GET(ApiConstants.profile)
  Future<BaseResponse<ProfileModel>> getProfile();

  @POST(ApiConstants.updateProfile)
  @MultiPart()
  Future<MessageModel> updateProfile({
    @Part() File? image,
    @Part() String? name,
    @Part(name: 'whatsapp_phone') String? whatsappPhone,
    @Part() String? phone,
    @Part(name: 'country_id') String? countryId,
    @Part(name: 'branch_id') String? branchId,
    @Part(name: 'region_id') String? regionId,
    @Part(name: 'city_id') String? cityId,
    @Part(name: 'whatsapp_2') String? whatsapp2,
    @Part(name: 'whatsapp_2_key') String? whatsapp2Key,
    @Part(name: 'whatsapp_3') String? whatsapp3,
    @Part(name: 'whatsapp_3_key') String? whatsapp3Key,
    @Part(name: 'whatsapp_4') String? whatsapp4,
    @Part(name: 'whatsapp_4_key') String? whatsapp4Key,
    @Part() String? code,
  });

  @POST(ApiConstants.deleteAccount)
  Future<MessageModel> deleteAccount();

  @POST(ApiConstants.logout)
  Future<MessageModel> logout();
}
