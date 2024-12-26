import 'dart:developer';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:risha_app/config/api_paths.dart';
import 'package:risha_app/config/json_constants.dart';
import 'package:risha_app/core/errors/failure.dart';
import 'package:risha_app/core/services/api_response_handler.dart';
import 'package:risha_app/core/services/api_services.dart';
import 'package:risha_app/dummy_data.dart';
import 'package:risha_app/features/account/data/models/category_model.dart';
import 'package:risha_app/features/auth/data/models/user_model.dart';

class AccountRemoteDatasource {
  Future<Either<Failure, List<CategoryModel>>> fetchCategories() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      log("API DUMMY DATA: ${dummyCategories.toString()}");
      return right(List<CategoryModel>.from(dummyCategories));
    } catch (e) {
      return left(UnknownFailure(e.toString()));
    }
  }

  Future<Either<Failure, List<CategoryModel>>> fetchUserCategories() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      return right(List<CategoryModel>.from(userCategories));
    } catch (e) {
      return left(UnknownFailure(e.toString()));
    }
  }

  Future<Either<Failure, UserModel>> updateAccount(
    UserModel user,
  ) async {
    try {
      final image = user.profileImage != null
          ? user.profileImage!.contains("http")
              ? null
              : File(user.profileImage!)
          : null;
      final res = await RestApiService.multipartPost(
        ApiPaths.updateAccount,
        fileKey: UserModelConstants.profileImage,
        fields: user.toUpdateProfileJson(),
        file: image,
      );

      log(res.body);

      return ApiResponseHandler.handleSingleResponse<UserModel>(
        res,
        (json) => UserModel.fromJson(json),
        jsonPath: "data",
      );
    } catch (e, stackTrace) {
      log("ERROR", stackTrace: stackTrace, error: e);
      return left(AuthFailure(e.toString()));
    }
  }

  Future<Either<Failure, void>> updatePassword(
      String oldPassword, String newPassword) async {
    try {
      final res = await RestApiService.post(
        ApiPaths.resetPassword,
        {
          "old_password": oldPassword,
          "new_password": newPassword,
        },
      );

      log(res.body);

      return ApiResponseHandler.handleSingleResponse<Null>(res, null);
    } catch (e, stackTrace) {
      log("ERROR", stackTrace: stackTrace, error: e);
      return left(AuthFailure(e.toString()));
    }
  }
}
