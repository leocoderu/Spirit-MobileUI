void main() async {
  methodA();
  await methodB();
  await methodC('main');
  methodD();
}

void methodA(){
  print('sync A');
}

Future<void> methodB() async {
  print('sync B start');
  await methodC('B');
  print('sync B end');
}

Future<void> methodC(String from) async {
  print('sync C start from $from');

  Future(() {
    print('C running Future from $from');
  }).then((_){
    print('C end of Future from $from');
  });

  Future.microtask(() => print('microtask from $from'));

  print('sync C end from $from');
}

void methodD(){
  print('sync D');
}

// sync A
// sync B start
// sync C start from B
// sync C end from B
// microtask from B
// sync B end
// sync C start from main
// sync C end from main
// microtask from main
// sync D
// C running Future from B
// C end of Future from B
// C running Future from main
// C end of Future from main