import 'package:dartz/dartz.dart';
import '../../core/errors/failures.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, List<User>>> getUsers({String? cancelToken});
  Future<Either<Failure, List<User>>> searchUsers(
    String query, {
    String? cancelToken,
  });
}