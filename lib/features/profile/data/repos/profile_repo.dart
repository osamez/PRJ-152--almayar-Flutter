import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/models/message_model.dart';
import 'package:almeyar/core/models/message_response.dart';
import 'package:almeyar/core/network/result.dart';
import 'package:almeyar/features/profile/data/models/gift_card_model.dart';
import 'package:almeyar/features/profile/data/models/profile_model.dart';
import 'package:almeyar/features/profile/data/models/update_password_request.dart';
import 'dart:io';

abstract class ProfileRepo {
  Future<Result<BaseResponse<List<GiftCardModel>>>> getGiftCards();

  Future<Result<BaseResponse<ProfileModel>>> getProfile();

  Future<Result<MessageModel>> updateProfile({
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

  Future<Result<MessageModel>> deleteAccount();

  Future<Result<MessageModel>> logout();

  Future<Result<MessageResponse>> updatePassword(UpdatePasswordRequest request);

  Future<Result<BaseResponse<String>>> getPrivacyPolicy();

  Future<Result<BaseResponse<String>>> getAboutApp();

  Future<Result<BaseResponse<String>>> getTermsAndConditions();
}
