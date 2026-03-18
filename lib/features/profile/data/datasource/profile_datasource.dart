import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/models/message_model.dart';

import 'package:almeyar/core/models/message_response.dart';
import 'package:almeyar/features/profile/data/models/gift_card_model.dart';
import 'package:almeyar/features/profile/data/models/profile_model.dart';
import 'package:almeyar/features/profile/data/models/update_password_request.dart';
import 'dart:io';

abstract class ProfileDataSource {
  Future<BaseResponse<List<GiftCardModel>>> getGiftCards();

  Future<BaseResponse<ProfileModel>> getProfile();

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
  });

  Future<MessageModel> deleteAccount();

  Future<MessageModel> logout();

  Future<MessageResponse> updatePassword(UpdatePasswordRequest request);
}
