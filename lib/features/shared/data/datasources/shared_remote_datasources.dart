import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:risha_app/config/api_paths.dart';
import 'package:risha_app/core/errors/failure.dart';
import 'package:risha_app/core/services/api_response_handler.dart';
import 'package:risha_app/core/services/api_services.dart';
import 'package:risha_app/features/account/data/models/countries_model.dart';
import 'package:risha_app/features/auth/data/models/user_model.dart';

class SharedRemoteDatasources {
  Future<Either<Failure, UserModel>> getUserData() async {
    final res = await RestApiService.get(ApiPaths.fetchUserData);

    log("Request: ${res.request}");
    log("StatusCode: ${res.statusCode}");
    log("Headers: ${res.headers}");

    log("FETCHING USER: ${res.body}");

    try {
      return ApiResponseHandler.handleSingleResponse<UserModel>(
        res,
        (json) => UserModel.fromJson(json).copyWith(
          country: Country(
            name: "Palestine",
            name_ar: "فلسطين",
            dial_code: "+970",
            currency: "ILS",
            iso2: "PS",
            iso3: "PSE",
            is_arabian_country: true,
            is_khaliji_country: false,
            flag: "🇵🇸",
            order: 7,
          ),
        ),
        jsonPath: "user",
      );
    } catch (e) {
      return left(UnknownFailure(e.toString()));
    }
  }
}
