import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:risha_app/config/api_paths.dart';
import 'package:risha_app/config/json_constants.dart';
import 'package:risha_app/core/errors/failure.dart';
import 'package:risha_app/core/errors/strings.dart';
import 'package:risha_app/core/network/network_mixin.dart';
import 'package:risha_app/core/services/api_response_handler.dart';
import 'package:risha_app/core/services/api_services.dart';
import 'package:risha_app/features/auth/data/models/user_model.dart';
import 'package:fpdart/fpdart.dart';

class AuthRemoteDatasource with NetworkMixin {
  Future<Either<Failure, UserModel>> login(
    String email,
    String password,
  ) async {
    if (!await isConnected) {
      return left(NetworkFailure(noInternetConnection));
    }
    try {
      final res = await RestApiService.post(ApiPaths.login, {
        UserModelConstants.email: email,
        UserModelConstants.password: password,
      });
      log(res.body);

      final token = jsonDecode(res.body)[UserModelConstants.token];

      return ApiResponseHandler.handleSingleResponse<UserModel>(
        res,
        (json) => UserModel.fromJson(json).copyWith(token: token),
        jsonPath: "user",
      );
    } catch (e) {
      return left(AuthFailure(e.toString()));
    }
  }

  Future<Either<Failure, UserModel>> signup(
    UserModel user,
  ) async {
    try {
      if (!await isConnected) {
      return left(NetworkFailure(noInternetConnection));
    }
      final image = user.profileImage != null ? File(user.profileImage!) : null;
      final res = await RestApiService.multipartPost(
        ApiPaths.signup,
        fileKey: UserModelConstants.profileImage,
        fields: user.toSignupJson(),
        file: image,
      );

      log(res.body);

      final token = jsonDecode(res.body)[UserModelConstants.token];

      return ApiResponseHandler.handleSingleResponse<UserModel>(
        res,
        (json) => UserModel.fromJson(json).copyWith(token: token),
        jsonPath: "user",
      );
    } catch (e, stackTrace) {
      log("ERROR", stackTrace: stackTrace);
      return left(AuthFailure(e.toString()));
    }
  }
}
