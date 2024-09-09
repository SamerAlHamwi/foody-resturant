import '../../infrastructure/models/data/user.dart';
import '../handlers/handlers.dart';
import '../../infrastructure/models/models.dart';

abstract class AuthRepository {
  Future<ApiResult<LoginResponse>> login({
    required String email,
    required String password,
  });

  Future<ApiResult<LoginResponse>> loginWithSocial({
    String? email,
    String? displayName,
    String? id,
  });

  Future<ApiResult<ProfileResponse>> signUp({
    required String email,
  });

  Future<ApiResult<VerifyData>> sigUpWithPhone({
    required UserModel user,
  });

  Future<ApiResult<RegisterResponse>> sendOtp({required String phone});

  Future<ApiResult<RegisterResponse>> forgotPassword({required String email});

  Future<ApiResult<VerifyData>> forgotPasswordConfirm({
    required String verifyCode,
    required String email,
  });

  Future<ApiResult<VerifyData>> forgotPasswordConfirmWithPhone({
    required String phone,
  });

  Future<ApiResult<VerifyPhoneResponse>> verifyPhone({
    required String verifyId,
    required String verifyCode,
  });

  Future<ApiResult<VerifyPhoneResponse>> verifyEmail({
    required String verifyCode,
  });

  Future<ApiResult<VerifyData>> sigUpWithData({
    required UserModel user,
  });

  Future<ApiResult<CheckPhoneResponse>>  checkPhone({required String phone});

}
