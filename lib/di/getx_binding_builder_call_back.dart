import 'package:frontend/data/repository/diary/diary_repository_impl.dart';
import 'package:frontend/data/repository/emoticon/emoticon_repository_impl.dart';
import 'package:frontend/data/repository/emotion_stamp_repository/emotion_stamp_repository_impl.dart';
import 'package:frontend/data/repository/on_boarding_repository/on_boarding_repository_impl.dart';
import 'package:frontend/core/utils/notification_controller.dart';
import 'package:frontend/data/repository/token_repository_impl.dart';
import 'package:frontend/data/repository/social_login_repository/apple_login_impl.dart';
import 'package:frontend/data/repository/server_login_repository_impl.dart';
import 'package:frontend/data/repository/social_login_repository/kakao_login_impl.dart';
import 'package:frontend/data/repository/upload/file_upload_repository_impl.dart';

import 'package:frontend/data/repository/wise_saying/wise_saying_repository_impl.dart';
import 'package:frontend/data/repository/withdraw/withdraw_repository_impl.dart';
import 'package:frontend/domain/model/diary/diary_data.dart';
import 'package:frontend/domain/use_case/diary/delete_diary_use_case.dart';
import 'package:frontend/domain/use_case/diary/save_diary_use_case.dart';
import 'package:frontend/domain/use_case/diary/update_diary_use_case.dart';
import 'package:frontend/domain/use_case/emoticon_use_case/get_emoticon_use_case.dart';
import 'package:frontend/domain/use_case/emotion_stamp_use_case/get_emotion_diary_use_case.dart';
import 'package:frontend/domain/use_case/on_boarding_use_case/on_boarding_use_case.dart';
import 'package:frontend/domain/use_case/token_use_case.dart';
import 'package:frontend/domain/use_case/social_login_use_case/apple_login_use_case.dart';
import 'package:frontend/domain/use_case/social_login_use_case/kakao_login_use_case.dart';
import 'package:frontend/domain/use_case/upload/file_upload_use_case.dart';
import 'package:frontend/domain/use_case/wise_saying_use_case/get_wise_saying_use_case.dart';
import 'package:frontend/domain/use_case/withdraw/withdraw_use_case.dart';
import 'package:frontend/main_view_model.dart';
import 'package:frontend/presentation/diary/diary_detail/diary_detail_view_model.dart';
import 'package:frontend/presentation/diary/diary_view_model.dart';
import 'package:frontend/presentation/diary/write_diary_view_model.dart';
import 'package:frontend/presentation/emotion_stamp/emotion_stamp_view_model.dart';
import 'package:frontend/presentation/home/home_view_model.dart';
import 'package:frontend/presentation/login/login_terms_information/login_terms_information_viewmodel.dart';
import 'package:frontend/presentation/login/login_view_model.dart';
import 'package:frontend/presentation/on_boarding/on_boarding_age/on_boarding_age_viewmodel.dart';
import 'package:frontend/presentation/on_boarding/on_boarding_job/on_boarding_job_viewmodel.dart';
import 'package:frontend/presentation/on_boarding/on_boarding_nickname/on_boarding_nickname_viewmodel.dart';
import 'package:frontend/presentation/profile/book_mark/book_mark_view_model.dart';
import 'package:frontend/presentation/profile/profile_setting/profile_setting_view_model.dart';
import 'package:frontend/presentation/profile/profile_setting/withdraw/withdraw_view_model.dart';
import 'package:frontend/presentation/profile/profile_view_model.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';

final KakaoLoginImpl kakaoLoginImpl = KakaoLoginImpl();
final AppleLoginImpl appleLoginImpl = AppleLoginImpl();
final TokenRepositoryImpl tokenRepositoryImpl = TokenRepositoryImpl();
final ServerLoginRepositoryImpl serverLoginImpl = ServerLoginRepositoryImpl();
final OnBoardingRepositoryImpl onBoardingImpl = OnBoardingRepositoryImpl();
final WiseSayingRepositoryImpl wiseSayingRepositoryImpl =
    WiseSayingRepositoryImpl();
final FileUploadRepositoryImpl fileUploadRepositoryImpl =
    FileUploadRepositoryImpl();
final diaryRepository = DiaryRepositoryImpl();

//use case
final KakaoLoginUseCase kakaoLoginUseCase = KakaoLoginUseCase(
  socialLoginRepository: kakaoLoginImpl,
  serverLoginRepository: serverLoginImpl,
  tokenRepository: tokenRepositoryImpl,
  onBoardingUseCase: onBoardingUseCase,
);

final AppleLoginUseCase appleLoginUseCase = AppleLoginUseCase(
  socialLoginRepository: appleLoginImpl,
  serverLoginRepository: serverLoginImpl,
  tokenRepository: tokenRepositoryImpl,
  onBoardingUseCase: onBoardingUseCase,
);

final OnBoardingUseCase onBoardingUseCase = OnBoardingUseCase(
  onBoardingRepository: onBoardingImpl,
);

final TokenUseCase tokenUseCase = TokenUseCase(
  tokenRepository: tokenRepositoryImpl,
);

final WithdrawUseCase withDrawUseCase = WithdrawUseCase(
  withdrawRepository: WithdrawRepositoryImpl(),
  kakaoLoginUseCase: kakaoLoginUseCase,
  appleLoginUseCase: appleLoginUseCase,
);

final GetWiseSayingUseCase getWiseSayingUseCase = GetWiseSayingUseCase(
  wiseSayingRepository: wiseSayingRepositoryImpl,
);

final GetEmoticonUseCase getEmoticonUseCase =
    GetEmoticonUseCase(emoticonRepository: EmoticonRepositoryImpl());

final GetEmotionStampUseCase getEmotionStampUseCase = GetEmotionStampUseCase(
  emotionStampRepository: EmotionStampRepositoryImpl(),
);

final FileUploadUseCase fileUploadUseCase =
    FileUploadUseCase(fileUploadRepository: fileUploadRepositoryImpl);
final profileViewModel = ProfileViewModel();
final saveDiaryUseCase = SaveDiaryUseCase(
  diaryRepository: diaryRepository,
);
final updateDiaryUseCase = UpdateDiaryUseCase(
  diaryRepository: diaryRepository,
);
final deleteDiaryUseCase = DeleteDiaryUseCase(
  diaryRepository: diaryRepository,
);

void getMainBinding() {
  Get.put(MainViewModel(
    tokenUseCase: tokenUseCase,
    onBoardingUseCase: onBoardingUseCase,
  ));
  Get.put(NotificationController());
}

void getLoginBinding() {
  Get.put(LoginViewModel(
    kakaoLoginUseCase: kakaoLoginUseCase,
    appleLoginUseCase: appleLoginUseCase,
    onBoardingUseCase: onBoardingUseCase,
  ));
}

void getDiaryBinding() {
  Get.put(
    DiaryViewModel(
      getEmoticonUseCase: getEmoticonUseCase,
    ),
  );
}

void getWriteDiaryBinding() {
  Get.put(
    WriteDiaryViewModel(),
  );
}

void getDiaryDetailBinding({
  required DiaryData diaryData,
  required bool isStamp,
  required CroppedFile? imageFile,
}) {
  Get.put(DiaryDetailViewModel(
    getWiseSayingUseCase: getWiseSayingUseCase,
    fileUploadUseCase: fileUploadUseCase,
    saveDiaryUseCase: saveDiaryUseCase,
    updateDiaryUseCase: updateDiaryUseCase,
    deleteDiaryUseCase: deleteDiaryUseCase,
    diaryData: diaryData,
    imageFile: imageFile,
    isStamp: isStamp,
    getEmotionStampUseCase: getEmotionStampUseCase,
  ));
}

void getLoginTermsInformationBinding() {
  Get.put(LoginTermsInformationViewModel(
    kakaoLoginUseCase: kakaoLoginUseCase,
    appleLoginUseCase: appleLoginUseCase,
  ));
}

void getOnBoardingJobBinding() {
  Get.put(OnBoardingJobViewModel(
    onBoardingUseCase: onBoardingUseCase,
  ));
}

void getOnBoardingBirthBinding() {
  Get.put(OnBoardingAgeViewModel());
}

void getOnBoardingNickNameBinding() {
  Get.put(OnBoardingNicknameViewModel());
}

void getProfileBinding() {
  Get.put(
    profileViewModel,
  );
}

EmotionStampViewModel getEmotionStampBinding() {
  return Get.put(EmotionStampViewModel(
    getEmotionStampUseCase: getEmotionStampUseCase,
  ));
}

HomeViewModel getHomeViewModelBinding() {
  return Get.put(
    HomeViewModel(
      getEmotionStampUseCase: getEmotionStampUseCase,
    ),
  );
}

void getWithdrawViewModelBinding() {
  Get.put(
    WithdrawViewModel(
      withdrawUseCase: withDrawUseCase,
    ),
  );
}

void getProfileSettingViewModelBinding() {
  Get.put(
    ProfileSettingViewModel(
      kakaoLoginUseCase: kakaoLoginUseCase,
      appleLoginUseCase: appleLoginUseCase,
      onBoardingUseCase: onBoardingUseCase,
    ),
  );
}

void getBookMarkViewModelBinding() {
  Get.put(
    BookMarkViewModel(),
  );
}
