import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/models/message_model.dart';

import 'package:almeyar/core/models/message_response.dart';
import 'package:almeyar/features/profile/data/api_service/profile_api_service.dart';
import 'package:almeyar/features/profile/data/datasource/profile_datasource.dart';
import 'package:almeyar/features/profile/data/models/gift_card_model.dart';
import 'package:almeyar/features/profile/data/models/profile_model.dart';
import 'package:almeyar/features/profile/data/models/update_password_request.dart';
import 'dart:io';

class ProfileDataSourceImpl implements ProfileDataSource {
  final ProfileApiService _apiService;

  const ProfileDataSourceImpl(this._apiService);

  @override
  Future<BaseResponse<List<GiftCardModel>>> getGiftCards() async {
    return await _apiService.getGiftCards();
  }

  @override
  Future<BaseResponse<ProfileModel>> getProfile() async {
    return await _apiService.getProfile();
  }

  @override
  Future<MessageModel> updateProfile({
    File? image,
    String? name,
    String? whatsappPhone,
    String? phone,
    String? countryId,
    String? branchId,
    String? regionId,
    String? cityId,
    String? whatsapp2,
    String? whatsapp2Key,
    String? whatsapp3,
    String? whatsapp3Key,
    String? whatsapp4,
    String? whatsapp4Key,
    String? code,
  }) async {
    return await _apiService.updateProfile(
      image: image,
      name: name,
      whatsappPhone: whatsappPhone,
      phone: phone,
      countryId: countryId,
      branchId: branchId,
      regionId: regionId,
      cityId: cityId,
      whatsapp2: whatsapp2,
      whatsapp2Key: whatsapp2Key,
      whatsapp3: whatsapp3,
      whatsapp3Key: whatsapp3Key,
      whatsapp4: whatsapp4,
      whatsapp4Key: whatsapp4Key,
      code: code,
    );
  }

  @override
  Future<MessageModel> deleteAccount() async {
    return await _apiService.deleteAccount();
  }

  @override
  Future<MessageModel> logout() async {
    return await _apiService.logout();
  }

  @override
  Future<MessageResponse> updatePassword(UpdatePasswordRequest request) async {
    return await _apiService.updatePassword(request);
  }
}
