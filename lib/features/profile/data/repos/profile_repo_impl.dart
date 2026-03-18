import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/network/result.dart';
import 'package:almeyar/core/utils/app_logger.dart';
import 'package:almeyar/features/profile/data/datasource/profile_datasource.dart';
import 'package:almeyar/features/profile/data/models/gift_card_model.dart';
import 'package:almeyar/features/profile/data/models/profile_model.dart';
import 'package:almeyar/features/profile/data/repos/profile_repo.dart';

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
}
