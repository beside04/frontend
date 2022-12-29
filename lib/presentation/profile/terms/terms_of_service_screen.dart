import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/config/theme/color_data.dart';
import 'package:frontend/config/theme/text_data.dart';
import 'package:frontend/di/getx_binding_builder_call_back.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kBlackColor),
        backgroundColor: kWhiteColor,
        title: Text(
          "서비스 이용약관",
          style: kHeader3BlackStyle,
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.close,
            ),
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Scrollbar(
          thumbVisibility: true,
          thickness: 4.0,
          radius: Radius.circular(8.0),
          child: Markdown(
            data: '''
## 제 1 장 총칙


### 제 1 조 (목적)

본 약관은 팀 ‘하루냥’(이하 “단체”)가 제공하는 모바일 애플리케이션 “하루냥”의 이용에 대한 단체와 서비스 이용자의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.

### 제 2 조 (용어의 정의)

이 약관에서 사용하는 용어의 정의는 아래와 같습니다.

1. “단체”라 함은 모바일 기기를 통한 서비스의 주체를 말합니다.
2. “이용자”란 이 약관에 따라 이용계약을 체결하고, 단체가 제공하는 서비스를 이용하는 자를 의미합니다.
3. “모바일 기기”란 콘텐츠를 다운로드 받거나 설치하여 사용할 수 있는 기기로서, 휴대폰, 스마트폰 등을 의미합니다.
4. “이용자 정보”란 이용자의 날씨 기록, 감정 기록, 일기 작성 내역 등 이용자가 단체에 제공한 정보와 서비스 이용정보 등을 통칭합니다.
5. “콘텐츠”란 모바일 기기로 이용할 수 있도록 단체가 서비스 제공과 관련하여 디지털 방식으로 제작한 유료 또는 무료의 내용물 일체를 의미합니다.
6. “애플리케이션”이란 단체가 제공하는 서비스를 이용하기 위해 모바일 기기를 통하여 다운로드 받거나 설치하여 사용하는 프로그램 일체를 의미합니다.
7. “서비스”라 함은 단체가 제공하는 모든 편의사항과 이용자가 모바일 기기에서 실행하는 단체 소유의 애플리케이션 및 이에 부수하는 서비스를 의미합니다.

### 제 3 조 (약관의 효력 및 변경)

1. 단체는 이 약관을 설정 메뉴 등에 게시합니다.
2. 단체는 이 약관의 내용을 이용자가 알 수 있도록 서비스 내 또는 그 연결 화면에 게시합니다.
3. 단체는 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
4. 단체가 이 약관을 개정한 경우에는 적용일자 및 개정내용, 개정 사유 등을 명시하여 최소한 그 적용일 7일 이전부터 서비스 내 또는 그 연결 화면에 게시하여 회원에게 공지합니다. 다만, 변경된 내용이 회원에게 불리하거나 중대한 사항의 변경인 경우에는 그 적용일 30일 이전까지 본문과 같은 방법으로 공지합니다.
5. 단체는 이용자가 단체와 이 약관의 내용에 관하여 질의 및 응답을 할 수 있도록 조치를 취합니다.
6. 이용자는 약관 일부분만을 동의 또는 거부할 수 없습니다.
7. 서비스 이용을 시작한 경우 약관에 동의한 것으로 간주합니다.

### 제 4 조 (이용 계약의 체결 및 적용)

1. 이용계약은 이용자가 되고자 하는 자(이하 ‘이용신청자’라 합니다.)가 이 약관의 내용에 대하여 동의를 한 다음 서비스 이용 신청을 하고, 단체가 그 신청에 대해 승낙함으로써 체결됩니다.
2. 단체는 이용신청자의 신청에 대해 승낙함을 원칙으로 합니다. 다만, 단체는 다음 각 호의 어느 하나에 해당하는 이용 신청에 대해서는 승낙을 거절할 수 있습니다.
    1. 사회의 안녕과 질서 또는 미풍양속을 저해할 목적으로 신청한 경우
    2. 타인의 정보 도용 등 등록 내용을 허위로 기재한 사실이 있는 경우
    3. 부정한 용도로 서비스를 이용하고자 하는 경우
    4. 기타 단체의 사정상 승낙이 어렵거나 가입 결격 사유에 해당하는 경우

## 제 2 장 개인정보 관리

### 제 5 조 (개인정보의 보호 및 사용)

1. 단체는 관련 법령이 정하는 바에 따라 이용자의 개인정보를 보호하기 위해 노력하며 개인정보의 보호 및 사용에 대해서는 관련 법령 및 단체의 개인정보처리방침에 따릅니다. 다만, 단체가 제공하는 서비스 이외의 링크된 서비스에서는 단체의 개인정보처리방침이 적용되지 않습니다.
2. 단체는 관련 법령에 의해 관련 국가기관 등의 요청이 있는 경우를 제외하고는 이용자의 개인정보를 본인의 동의 없이 타인에게 제공하지 않습니다.
3. 단체는 이용자의 귀책사유로 개인정보가 유출되어 발생한 피해에 대해 책임을 지지 않습니다.

## 제 3 장 이용계약 당사자의 의무

### 제 6 조 (단체의 의무)

1. 단체는 관련 법령, 이 약관에서 정하는 권리의 행사 및 의무의 이행을 신의에 따라 성실하게 준수합니다.
2. 단체는 이용자가 안전하게 서비스를 이용할 수 있도록 개인정보 보호를 위해 개인정보처리 방침을 공시하고 준수합니다. 단체는 이 약관 및 개인정보 처리방침에서 정한 경우를 제외하고는 이용자의 개인정보가 제3자에게 공개 또는 제공되지 않도록 합니다.
3. 단체는 단체가 정한 이용약관 및 운영정책 혹은 법령을 위반하는 이용자들을 강제 이용 중단 조치할 수 있습니다.

### 제 7 조 (이용자의 의무)

1. 이용자는 단체에서 제공하는 서비스의 이용과 관련하여 다음 각 호에 해당하는 행위를 해서는 안됩니다.
    1. 단체의 서비스를 이용하여 얻은 전보를 무단으로 복제, 유통, 조장하거나 상업적으로 이용하는 행위, 알려지지 않은 버그를 악용하여 서비스를 이용하는 행위
    2. 욕설, 음담패설 같은 부정적 단어를 닉네임으로 설정하는 행위
    3. 단체로부터 특별한 권리를 부여받지 않고 애플리케이션을 변경하거나, 애플리케이션에 다른 프로그램을 추가 혹은 삽입하거나, 서버를 해킹 혹은 역설계하거나, 소스코드나 애플리케이션 데이터를 유출 혹은 변경하거나, 별도의 서버를 구축하거나, 웹사이트의 일부분을 임의로 변경 혹은 도용하여 단체를 사칭하는 행위
    4. 그 밖에 관련 법령에 위반되거나 선량한 풍속 기타 사회통념에 반하는 행위
2. 이용자의 계정 및 모바일 기기에 관한 관리 책임은 이용자에게 있으며, 이를 타인이 이용하도록 해서는 안됩니다. 모바일 기기의 관리 부실이나 타인에게 이용을 승낙함으로 인해 발생하는 손해에 대해서 단체는 책임을 지지 않습니다.

## 제 4 장 서비스 이용 및 이용 제한

### 제 8 조 (서비스의 제공)

1. 단체는 제 4조의 규정에 따라 이용계약이 완료된 이용자에게 그 즉시 서비스를 이용할 수 있도록 합니다. 다만, 일부 서비스의 경우 단체의 필요에 따라 지정된 일자부터 서비스를 게시할 수 있습니다.
2. 단체는 이용자에게 서비스를 제공할 때 이 약관에 정하고 있는 서비스를 포함하여 기타 부가적인 서비스를 함께 제공할 수 있습니다.
3. 단체는 이용자의 이용시간, 이용횟수, 제공 서비스의 범위 등을 세분화하여 이용에 차등을 둘 수 있습니다.
4. 단체는 일기 작성, 일기 내용과 기록한 날씨, 기분에 따른 명언 추천 서비스와 그와 연계된 기타 서비스를 제공합니다.
5. 단체는 이용자의 개인정보 및 서비스 이용 기록에 따라 서비스 이용에 차이를 둘 수 있습니다.

### 제 9 조 (서비스의 이용)

1. 단체는 다음 각 호의 경우에는 서비스의 전부 또는 일부를 일시 정지할 수 있습니다. 이 경우 단체는 사전에 그 정지의 사유와 기간을 애플리케이션 초기화면이나 서비스 공지사항 등에 공지합니다. 다만 사전에 공지할 수 없는 부득이한 사정이 있는 경우 사후에 공지할 수 있습니다.
    1. 시스템 정기점검, 서버의 증설 및 교체, 네트워크의 불안정 등의 시스템 운영상 필요한 경우
    2. 정전, 서비스 설비의 장애, 서비스 이용폭주, 기간통신사업자의 설비 보수 또는 점검 등으로 인하여 정상적인 서비스 제공이 불가능한 경우
    3. 전시, 사변, 천재지변 또는 이에 준하는 국가 비상사태 등 단체가 통제할 수 없는 상황이 발생한 경우
2. 단체는 모바일 기기를 위한 전용 애플리케이션 또는 네트워크를 이용하여 서비스를 제공합니다. 이용자는 애플리케이션을 다운로드하여 설치하거나 네트워크를 이용하여 무료 또는 유료로 서비스를 이용할 수 있습니다.
3. 다운로드하여 설치한 애플리케이션 또는 네트워크를 통해 이용하는 서비스의 경우에는 모바일 기기 또는 이동통신사의 특성에 맞도록 제공됩니다. 모바일 기기의 변경, 번호 변경 또는 해외 로밍의 경우에는 콘텐츠의 전부 또는 일부의 이용이 불가능할 수 있으며, 이 경우 단체는 책임을 지지 않습니다.
4. 다운로드하여 설치한 애플리케이션 또는 네트워크를 통해 이용하는 서비스의 경우에는 백그라운드 작업이 진행될 수 있습니다. 이 경우 모바일 기기 또는 이동통신사의 특성에 맞도록 추가요금이 발생할 수 있으며 이와 관련하여 단체는 책임을 지지 않습니다.

### 제 10 조 (서비스의 변경 및 중단)

1. 단체는 원활한 서비스 제공을 위해 운영상 또는 기술상의 필요에 따라 서비스를 변경할 수 있으며, 변경 전에 해당 내용을 서비스 내에 공지합니다. 다만, 버그, 오류 등의 수정이나 긴급 업데이트 등 부득이하게 변경할 필요가 있는 경우 또는 중대한 변경에 해당하지 않는 경우에는 사후에 공지할 수 있습니다.
2. 단체는 영업양도, 분할, 합병 등에 따른 영업 지속 불가능, 수익 악화 등 어려운 사유로 인해 서비스를 지속하기 힘든 경우에는 서비스 전부를 중단할 수 있습니다. 이 경우 중단일자 30일 이전까지 중단일자, 중단사유, 보상조건 등을 서비스 애플리케이션 초기화면 또는 그 연결화면을 통해 공지하고 제 16조 제 1항의 방법으로 이용자에게 통지합니다.

### 제 11 조 (정보의 수집)

1. 단체는 서비스 개선 및 고도화를 위한 목적으로 이용자에게 추가정보를 요청할 수 있습니다. 이 요청에 대해 이용자는 승낙하거나 거절할 수 있으며, 단체가 이 요청을 할 경우에는 이용자가 이 요청을 거절할 수 있다는 뜻을 함께 고지합니다.

### 제 12 조 (광고의 제공)

1. 단체는 서비스의 운영과 관련하여 서비스 내에 광고를 게재할 수 있습니다. 또한 수신에 동의한 사용자에 한하여 전자우편, 문자서비스(LMS, SMS), 푸시메시지 등의 방법으로 광고성 정보를 전송할 수 있습니다. 이 경우 사용자는 언제든지 수신을 거절할 수 있으며, 단체는 사용자의 수신 거절 시 광고성 정보를 발송하지 아니합니다.
2. 단체가 제공하는 서비스 중의 배너 또는 링크를 통해 타인이 제공하는 광고나 서비스에 연결될 수 있습니다.
3. 제 2항에 따라 타인이 제공하는 광고나 서비스에 연결될 경우 해당 영역에서 제공하는 서비스의 회사는 서비스 영역이 아니므로 단체가 신뢰성, 안정성 등을 보장하지 않으며, 그로 인한 사용자의 손해에 대하여도 단체는 책임을 지지 않습니다. 다만 단체가 고의 또는 중과실로 손해의 발생을 용이하게 하거나 손해 방지를 위한 조치를 취하지 아니한 경우에는 그러하지 아니합니다.

### 제 13 조 (저작권 등의 귀속)

1. 단체가 제작한 서비스 내의 콘텐츠에 대한 저작권과 기타 지적재산권은 단체에 귀속합니다.
2. 이용자가 서비스 내에 작성한 정보(이하 “게시물”)에 대한 책임, 권리, 저작권은 작성한 이용자에게 있으며 저작권법에 의해 보호받습니다.
3. 이용자는 단체가 제공하는 서비스를 이용해서 얻은 정보 중에서 단체 또는 제공업체에 지적재산권이 귀속된 정보를 단체 또는 제공업체의 사전 동의 없이 복제, 전송 등의 방법(편집, 공표, 공연, 배포, 방송, 2차적 저작물 작성 등을 포함합니다. 이하 같습니다)에 의하여 영리 목적으로 이용하거나 타인에게 이용하게 하여서는 안 됩니다.

## 제 5 장 손해배상 및 면책조항 등

### 제 14 조 (손해배상)

1. 단체 또는 이용자는 본 약관을 위반하여 상대방에게 손해를 입힌 경우에는 그 손해를 배상할 책임이 있습니다. 다만, 고의 또는 과실이 없는 경우에는 그러하지 아니합니다.
2. 단체가 개별서비스 제공자와 제휴 계약을 맺고 이용자에게 개별서비스를 제공하는 경우에 이용자가 이 개별서비스 이용약관에 동의를 한 뒤 개별서비스 제공자의 고의 또는 과실로 인해 사용자에게 손해가 발생한 경우에 그 손해에 대해서는 개벌서비스 제공자가 책임을 집니다.

### 제 15 조 (단체의 면책)

1. 단체는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관하여 책임을 지지 않습니다.
2. 단체는 서비스용 설비의 보수, 교체, 정기점검, 공사 등 기타 이에 준하는 사유로 발생한 손해에 대하여 책임을 지지 않습니다. 다만, 회사의 고의 또는 과실에 의한 경우에는 그러하지 아니합니다.
3. 단체는 사용자의 고의 또는 과실로 인한 서비스 이용에 장애에 대하여는 책임을 지지 않습니다. 다만, 사용자에게 부득이하거나 정당한 사유가 있는 경우에는 그러하지 아니합니다.
4. 이용자가 서비스와 관련하여 게재한 정보나 자료 등의 신뢰성, 정확성 등에 대하여 단체는 고의 또는 중대한 과실이 없는 한 책임을 지지 않습니다.
5. 단체는 이용자가 다른 이용자 또는 타인과 서비스를 매개로 발생한 거래나 분쟁에 대해 개입할 의무는 없으며, 이로 인한 손해에 대해 책임을 지지 않습니다.
6. 단체는 무료로 제공되는 서비스 이용과 관련하여 사용자에게 발생한 손해에 대해서는 책임을 지지 않습니다. 그러나 단체의 고의 또는 중과실에 의한 경우에는 그러하지 아니합니다.
7. 단체는 이용자가 서비스를 이용하여 기대하는 이익을 얻지 못하거나 상실한 것에 대하여 책임을 지지 않습니다.
8. 사용자가 모바일 기기의 변경, 모바일 기기의 번호 변경, 운영체제(OS) 버전의 변경, 해외 로밍, 통신사 변경 등으로 인해 콘텐츠 전부나 일부의 기능을 이용할 수 없는 경우 단체는 이에 대해 책임을 지지 않습니다. 다만, 단체의 고의 또는 과실에 의한 경우에는 그러하지 아니합니다.
9. 이용자가 회사가 제공하는 콘텐츠나 계정정보를 삭제한 경우 단체는 이에 대해 책임을 지지 않습니다. 다만, 단체의 고의 또는 과실에 의한 경우에는 그러하지 아니합니다.

### 제 16 조 (이용자에 대한 통지)

1. 단체가 이용자에게 통지를 하는 경우 이용자의 전자우편주소, 전자메모, 서비스 내 공지, 문자메시지(LMS/SMS) 등으로 할 수 있습니다.
2. 단체는 이용자 전체에게 통지를 하는 경우 7일 이상 서비스 내에 게시하거나 팝업화면 등을 제시함으로써 제 1항의 통지에 갈음할 수 있습니다.

### 제 17 조 (재판권 및 준거법)

1. 이 약관은 대한민국 법률에 따라 규율되고 해석됩니다. 단체와 이용자 간에 발생한 분쟁으로 소송이 제기되는 경우에는 법령에 정한 절차에 따른 법원을 관할 법원으로 합니다.
2. 단체가 작성한 게시물에 대한 권리는 단체에게 귀속되며, 이용자가 작성한 게시물에 대한 권리는 이용자에게 귀속됩니다. 단, 단체는 서비스의 운영, 확장, 홍보 등의 필요한 목적으로 이용자의 저작물을 합리적이고 필요한 범위 내에서 별도의 허락 없이 수정하여 무상으로 사용하거나 제휴사에게 제공할 수 있습니다. 이 경우, 이용자의 개인정보는 제공하지 않습니다.
3. 이 약관에서 정하지 아니한 사항에 관하여는 [전자상거래 등에서의 소비자보호에 관한 법률], [약관의 규제에 관한 법률], [정보통신망이용촉진 및 정보보호 등에 관한 법률], [콘텐츠 산업진흥법] 등 관련 법령 및 상관례에 따릅니다.

### 제 18 조 (이용자의 고충처리 및 분쟁해결)

1. 단체는 이용자의 편의를 고려하여 이용자의 의견이나 불만을 제시하는 방법을 서비스 내 또는 그 연결화면에 안내합니다.
2. 단체는 이용자로부터 제기되는 의견이나 불만이 정당하다고 객관적으로 인정될 경우에는 합리적인 기간 내에 이를 신속하게 처리합니다. 다만, 처리에 장기간이 소요되는 경우에는 이용자에게 장기간이 소요되는 사유와 처리일정을 서비스 내 공지하거나 제 16조 제 1항에 따라 통지합니다.
3. 단체와 이용자 간에 분쟁이 발생하여 제3의 분쟁조정기관이 조정할 경우 단체는 이용제한 등 이용자에게 조치한 사항을 성실히 증명하고, 조정기관의 조정에 따를 수 있습니다.

이 약관은 2023년 1월 29일에 업데이트 되었습니다.

---

Copyright © 하루냥. All rights reserved.''',
            styleSheet: MarkdownStyleSheet(
              h2: kHeader3BlackStyle,
              h3: kSubtitle1BlackStyle,
              p: kBody1BlackStyle,
            ),
          ),
        ),
      ),
    );
  }
}