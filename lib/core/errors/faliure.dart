import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

/// خطأ عند فشل الاتصال بالإنترنت
class NetworkFailure extends Failure {
  const NetworkFailure() : super("No Internet Connection");
}

/// خطأ عند فشل المصادقة (تسجيل الدخول أو التسجيل)
class AuthFailure extends Failure {
  const AuthFailure(String message) : super(message);
}

/// خطأ عام عند جلب البيانات
class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

/// خطأ عند عدم وجود بيانات
class NotFoundFailure extends Failure {
  const NotFoundFailure() : super("Data not found");
}

/// خطأ غير معروف
class UnknownFailure extends Failure {
  const UnknownFailure() : super("Unknown error occurred");
}
