import 'package:crypto_journal_mobile/app/user/service/dtos/update_user_dto.dart';

abstract class IUserRepository {
  Future getUser();
  Future updateUser(UpdateUserDto updateUserDto);
}
