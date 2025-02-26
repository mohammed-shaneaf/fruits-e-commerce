import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/faliure.dart';

import 'package:fruits_hub/features/Auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(String email, String password, String name);
}
