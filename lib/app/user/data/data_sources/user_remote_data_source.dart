import 'package:crypto_journal_mobile/app/user/data/inputs/update_user_input.dart';
import 'package:crypto_journal_mobile/app/user/data/models/user_model.dart';

abstract class IUserRemoteDataSource {
  Future<UserModel> getUser();
  Future<UserModel> updateUser(UpdateUserInput updateUserInput);
}
