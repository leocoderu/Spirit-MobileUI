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

  await Future(() {
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

//       READ:
//! MICROTASK: 'microtask from main', 'microtask from B'
//*     EVENT:   
//?    OUTPUT: sync A, sync B start, sync C start from B, C running Future from B, sync C end from B,
//              sync B end, sync C start from main, C running Future from main, C end of Future from main,
//              sync C end from main, sync D, microtask from B, microtask from main

// sync A
// sync B start
// sync C start from B
// C running Future from B
// C end of Future from B
// sync C end from B
// sync B end
// sync C start from main
// microtask from B
// C running Future from main
// C end of Future from main
// sync C end from main
// sync D
// microtask from main