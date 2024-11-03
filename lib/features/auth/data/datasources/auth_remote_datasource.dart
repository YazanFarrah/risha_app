import 'package:risha_app/core/enums/user_type_enum.dart';
import 'package:risha_app/core/errors/failure.dart';
import 'package:risha_app/core/models/chronic_disease_model.dart';
import 'package:risha_app/core/models/degree_of_insurance_model.dart';
import 'package:risha_app/core/models/policy_holder_model.dart';
import 'package:risha_app/core/models/subscription_status_model.dart';
import 'package:risha_app/core/models/user_model.dart';
import 'package:fpdart/fpdart.dart';

class AuthRemoteDatasource {
  Future<Either<Failure, UserModel>> login(
    String email,
    String password,
  ) async {
    try {
      await Future.delayed(Duration(seconds: 1));
      final user = UserModel(
        id: 1,
        arabicName: "جون دو",
        englishName: "John Doe",
        email: "johndoe@example.com",
        imageUrl:
            "https://img.freepik.com/free-vector/smiling-young-man-illustration_1308-174669.jpg",
        password: "password",
        birthday: "1990-01-01",
        type: UserTypeEnum.tech,
        token: "some_generated_token",
        city: "Amman",
        subscriptionDate: "2024-01-01",
        address: "123 Example St, Amman",
        verificationNumber: "123456",
        exceptions:
            "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Autem, maxime vero atque a commodi porro maiores numquam adipisci doloremque fugiat ratione non molestiae magnam delectus voluptas sed unde officiis possimus.lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem molestias nisi aliquid omnis hic et! Ratione, libero voluptatibus minima doloribus perspiciatis reprehenderit ducimus labore delectus quis voluptatum incidunt ipsa mollitia! Lorem ipsum dolor sit amet consectetur adipisicing elit. Blanditiis esse aperiam laborum ad consequuntur repellat nemo labore ipsum provident temporibus commodi cumque, consectetur aut dicta, sequi corporis repudiandae a quis.",
        nationalId: "123456789",
        chronicDiseases: ChronicDiseaseModel(
          id: 1,
          title: "Diabetes",
        ),
        phoneNumber: "0787293710",
        policyHolder: PolicyHolderModel(
          id: 2,
          title: "Company XYZ",
        ),
        degreeOfInsurance: DegreeOfInsuranceModel(
          id: 3,
          title: "Premium",
        ),
        status: Status.active,
        subscriptionStatus: SubscriptionStatusModel(
          id: 4,
          title: "Renewal",
        ),
      );

      return right(user);
    } catch (e) {
      return left(AuthFailure(e.toString()));
    }
  }
  Future<Either<Failure, UserModel>> signup(
    String fullName,
    String email,
    String password,
  ) async {
    try {
      await Future.delayed(Duration(seconds: 1));
      final user = UserModel(
        id: 1,
        arabicName: "جون دو",
        englishName: "John Doe",
        email: "johndoe@example.com",
        imageUrl:
            "https://img.freepik.com/free-vector/smiling-young-man-illustration_1308-174669.jpg",
        password: "password",
        birthday: "1990-01-01",
        type: UserTypeEnum.tech,
        token: "some_generated_token",
        city: "Amman",
        subscriptionDate: "2024-01-01",
        address: "123 Example St, Amman",
        verificationNumber: "123456",
        exceptions:
            "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Autem, maxime vero atque a commodi porro maiores numquam adipisci doloremque fugiat ratione non molestiae magnam delectus voluptas sed unde officiis possimus.lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem molestias nisi aliquid omnis hic et! Ratione, libero voluptatibus minima doloribus perspiciatis reprehenderit ducimus labore delectus quis voluptatum incidunt ipsa mollitia! Lorem ipsum dolor sit amet consectetur adipisicing elit. Blanditiis esse aperiam laborum ad consequuntur repellat nemo labore ipsum provident temporibus commodi cumque, consectetur aut dicta, sequi corporis repudiandae a quis.",
        nationalId: "123456789",
        chronicDiseases: ChronicDiseaseModel(
          id: 1,
          title: "Diabetes",
        ),
        phoneNumber: "0787293710",
        policyHolder: PolicyHolderModel(
          id: 2,
          title: "Company XYZ",
        ),
        degreeOfInsurance: DegreeOfInsuranceModel(
          id: 3,
          title: "Premium",
        ),
        status: Status.active,
        subscriptionStatus: SubscriptionStatusModel(
          id: 4,
          title: "Renewal",
        ),
      );

      return right(user);
    } catch (e) {
      return left(AuthFailure(e.toString()));
    }
  }

}
