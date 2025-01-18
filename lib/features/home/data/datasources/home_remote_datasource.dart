import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:risha_app/config/api_paths.dart';
import 'package:risha_app/core/errors/failure.dart';
import 'package:risha_app/core/errors/strings.dart';
import 'package:risha_app/core/network/network_mixin.dart';
import 'package:risha_app/core/services/api_response_handler.dart';
import 'package:risha_app/core/services/api_services.dart';
import 'package:risha_app/features/account/data/models/category_model.dart';
import 'package:risha_app/features/home/data/models/trendy_quizzes_model.dart';

class HomeRemoteDatasource with NetworkMixin {
  Future<Either<Failure, List<TrendyQuizzesModel>>>
      fetchTrendyQuizzesTypes() async {
    try {
      if (!await isConnected) {
        return left(NetworkFailure(noInternetConnection));
      }
      final res = await RestApiService.get(ApiPaths.fetchTrendyQuizzesTypes);
      log(res.body);
      return ApiResponseHandler.handleListResponse<TrendyQuizzesModel>(
        res,
        (json) => TrendyQuizzesModel.fromJson(json),
        jsonPath: "data",
      );
    } catch (e) {
      return left(UnknownFailure(e.toString()));
    }
  }

  Future<Either<Failure, List<TrendyQuizzesModel>>> fetchTrendyQuizzes() async {
    try {
      if (!await isConnected) {
        return left(NetworkFailure(noInternetConnection));
      }
      final res = await RestApiService.get(ApiPaths.fetchTrendyQuizzes);
      log(res.body);
      return ApiResponseHandler.handleListResponse<TrendyQuizzesModel>(
        res,
        (json) => TrendyQuizzesModel.fromJson(json),
        jsonPath: "data",
      );
    } catch (e) {
      return left(UnknownFailure(e.toString()));
    }
  }

  Future<Either<Failure, List<CategoryModel>>> fetchUserFavoriteCategories() async {
    try {
      if (!await isConnected) {
        return left(NetworkFailure(noInternetConnection));
      }
      final res = await RestApiService.get(
          ApiPaths.allCategoriesAndUserFavoriteCategories);

      return ApiResponseHandler.handleListResponse<CategoryModel>(
        res,
        (json) => CategoryModel.fromJson(json),
        jsonPath: "categories",
      );
    } catch (e) {
      return left(UnknownFailure(e.toString()));
    }
  }

  Future<List<Either<Failure, dynamic>>> refreshAllData() async {
    if (!await isConnected) {
      return [
        left(NetworkFailure(noInternetConnection)),
      ];
    }
    return Future.wait([
      fetchTrendyQuizzes(),
    ]);
  }
}
