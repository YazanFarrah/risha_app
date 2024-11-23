import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:risha_app/core/errors/failure.dart';
import 'package:risha_app/dummy_data.dart';
import 'package:risha_app/features/account/data/models/category_model.dart';

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
}
