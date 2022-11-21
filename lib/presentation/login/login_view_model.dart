import 'package:frontend/domain/use_case/access_token_use_case.dart';
import 'package:frontend/domain/use_case/kakao_login_use_case.dart';
import 'package:frontend/presentation/home/home_screen.dart';
import 'package:frontend/presentation/login/login_state.dart';
import 'package:frontend/presentation/login/login_terms_information/login_terms_information_screen.dart';
import 'package:frontend/res/constants.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController {
  final KakaoLoginUseCase kakaoLoginUseCase;
  final AccessTokenUseCase accessTokenUseCase;

  LoginViewModel({
    required this.kakaoLoginUseCase,
    required this.accessTokenUseCase,
  });

  final Rx<LoginState> _state = LoginState().obs;

  Rx<LoginState> get state => _state;

  Future<void> login() async {
    //social id 얻기
    final isSocialIdGet = await _getSocialId();
    if (!isSocialIdGet) {
      Get.snackbar('알림', '카카오 세션과 연결이 실패했습니다.');
      return;
    }

    //멤버 조회
    final checkMemberResult =
        await kakaoLoginUseCase.checkMember(state.value.socialId);

    //조회 결과
    switch (checkMemberResult) {
      case SocialIDCheck.existMember:
        //로그인
        await _onLoginAndMoveHome();
        break;
      case SocialIDCheck.notMember:
        //멤버가 아니면 약관 동의 페이지 이동
        Get.to(
          LoginTermsInformationScreen(
            socialId: state.value.socialId,
            email: state.value.email,
          ),
        );
        break;
      case SocialIDCheck.error:
        Get.snackbar('알림', '서버와의 연결이 실패했습니다.');
        return;
    }
  }

  Future<bool> _getSocialId() async {
    final socialLoginResult = await kakaoLoginUseCase.getKakaoSocialId();
    final email = socialLoginResult.email;
    final socialId = socialLoginResult.socialId;

    if (socialId.isEmpty) {
      return false;
    }

    _state.value = state.value.copyWith(
      socialId: socialId,
      email: email,
    );
    return true;
  }

  Future<void> _onLoginAndMoveHome() async {
    final loginResult = await kakaoLoginUseCase.login(state.value.socialId);
    await loginResult.when(
      success: (accessToken) async {
        await accessTokenUseCase.setAccessToken(accessToken);
        Get.offAll(const HomeScreen());
      },
      error: (message) {
        Get.snackbar('알림', '로그인이 실패했습니다.');
      },
    );
  }
}
