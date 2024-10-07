import 'package:flutter_riverpod/flutter_riverpod.dart';

// 창고 데이터 ( 책임 : 데이터 )
class BunModel {
  int bun;
  BunModel(this.bun);
}

// 창고 ( 책임 : 비즈니스 로직 관리 )
class BunStore extends StateNotifier<BunModel>{
  BunStore(super.state);

  void increase(){

    // 기존 값 변경
   BunModel model = super.state; // 받아온다
   model.bun++;
    // 변경된 값 복사
   super.state = BunModel(model.bun); // state에 새로 new 해서 넣어준다.
    // 기존값을 알아야지 증가시킬 수 있으니까 new 한거에 기존값을 넣어준다.
  }

  void decrease(){
    BunModel model = super.state;
    model.bun--;

    super.state = BunModel(model.bun);
  }

}

// 창고 관리자 ( 책임 : 창고 관리 )
final bunProvider = StateNotifierProvider<BunStore, BunModel>((ref) {
  BunModel model = BunModel(1);
  return BunStore(model);
  
});
