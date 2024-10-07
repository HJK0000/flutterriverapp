import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverapp/num_notify_provider.dart';
import 'package:riverapp/num_provider.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("HomePage");
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Top(),
          ),
          Expanded(
            child: Bottom(),
          ),
        ],
      ),
    );
  }
}

class Bottom extends ConsumerWidget{
  const Bottom({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("Bottom");

    //NumStore store = ref.read(numProvider);

    // 변경할 때는 read로 함
    BunStore store = ref.read(bunProvider.notifier); // read 이니까 창고에 접근 ( BunStore 로 받는다 )


    
    return Center(
      child: Container(
        child: InkWell(
          onTap: () {
            print("증가 클릭됨");
            store.increase();
          },
          child: Text(
            "증가",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}

class Top extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("Top");
    //NumStore store = ref.read(numProvider); // 프로바이더의 익명함수가 실행됨 ( 이때 창고가 생성됨 ) ( 창고 접근 )

    BunModel model = ref.watch(bunProvider); // watch !!! 프로바이더의 익명함수가 실행됨 ( 모델 접근 )

    return Center(
      child: Container(
        child: Text("${model.bun}", style: TextStyle(fontSize: 30)),
      ),
    );
  }
}