import 'package:flutter_riverpod/flutter_riverpod.dart';

// 창고 데이터 ( 책임 : 데이터 )
class NumModel { // 애가 int num을 관리. 다른 데이터도 관리할 거니까 class 로 만든다.
  int num = 1;
}

// 창고 ( 책임 : 비즈니스 로직 관리 )
class NumStore extends NumModel{

  void increase(){
    super.num++;
  }

  void decrease(){
    super.num--;
  }
}

//창고 관리자 ( 책임 : 창고 관리 )
final numProvider = StateProvider<NumStore>((ref) {
  print("StateProvider 창고 생성됨");
  return NumStore();
});
