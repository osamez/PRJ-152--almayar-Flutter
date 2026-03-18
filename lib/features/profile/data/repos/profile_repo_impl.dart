import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/models/message_model.dart';
import 'package:almeyar/core/models/message_response.dart';
import 'package:almeyar/core/network/result.dart';
import 'package:almeyar/core/utils/app_logger.dart';
import 'package:almeyar/features/profile/data/datasource/profile_datasource.dart';
import 'package:almeyar/features/profile/data/models/gift_card_model.dart';
import 'package:almeyar/features/profile/data/models/profile_model.dart';
import 'package:almeyar/features/profile/data/models/update_password_request.dart';
import 'package:almeyar/features/profile/data/repos/profile_repo.dart';
import 'dart:io';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileDataSource _dataSource;

  const ProfileRepoImpl(this._dataSource);

  @override
  Future<Result<BaseResponse<List<GiftCardModel>>>> getGiftCards() async {
    try {
      final response = await _dataSource.getGiftCards();
      AppLogger.info('ProfileRepoImpl - getGiftCards: Success');
      return Result.success(response);
    } catch (e, st) {
      AppLogger.error('ProfileRepoImpl - getGiftCards: Error', e, st);
      return Result.failure(e, st);
    }
  }

  @override
  Future<Result<BaseResponse<ProfileModel>>> getProfile() async {
    try {
      final response = await _dataSource.getProfile();
      AppLogger.info('ProfileRepoImpl - getProfile: Success');
      return Result.success(response);
    } catch (e, st) {
      AppLogger.error('ProfileRepoImpl - getProfile: Error', e, st);
      return Result.failure(e, st);
    }
  }

  @override
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
  }) async {
    try {
      final response = await _dataSource.updateProfile(
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
      AppLogger.info('ProfileRepoImpl - updateProfile: Success');
      return Result.success(response);
    } catch (e, st) {
      AppLogger.error('ProfileRepoImpl - updateProfile: Error', e, st);
      return Result.failure(e, st);
    }
  }

  @override
  Future<Result<MessageModel>> deleteAccount() async {
    try {
      final response = await _dataSource.deleteAccount();
      AppLogger.info('ProfileRepoImpl - deleteAccount: Success');
      return Result.success(response);
    } catch (e, st) {
      AppLogger.error('ProfileRepoImpl - deleteAccount: Error', e, st);
      return Result.failure(e, st);
    }
  }

  @override
  Future<Result<MessageModel>> logout() async {
    try {
      final response = await _dataSource.logout();
      AppLogger.info('ProfileRepoImpl - logout: Success');
      return Result.success(response);
    } catch (e, st) {
      AppLogger.error('ProfileRepoImpl - logout: Error', e, st);
      return Result.failure(e, st);
    }
  }

  @override
  Future<Result<MessageResponse>> updatePassword(
    UpdatePasswordRequest request,
  ) async {
    try {
      final response = await _dataSource.updatePassword(request);
      AppLogger.info('ProfileRepoImpl - updatePassword: Success');
      return Result.success(response);
    } catch (e, st) {
      AppLogger.error('ProfileRepoImpl - updatePassword: Error', e, st);
      return Result.failure(e, st);
    }
  }
}
