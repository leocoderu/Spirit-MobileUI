import 'dart:async';

void main(){
  print('Start');

  Future(() => 1).then(print);                                                //, event
  Future(() => Future(() => 2)).then(print);                                  //, event

  Future.delayed(const Duration(seconds: 1), () => 3).then(print);            //, event
  Future.delayed(const Duration(seconds: 1), () => Future(() => 4)).then(print);//, event

  //Future.delayed(Duration.zero, () => x)  === Future(() => x)

  Future.value(5).then(print);                          // in Microtask Queue   , microtask
  Future.value(Future(() => 6)).then(print);            // === Future(() => 6)//, event

  Future.sync(() => 7).then(print);                     // === Future.value(7)//, event
  Future.sync(() => Future(() => 8)).then(print);       // === Future(() => 8)//, event

  Future.microtask(() => 9).then(print);                                      //, microtask
  Future.microtask(() => Future(() => 10)).then(print); // === Future(() => 10) , microtask

  Future(() => 11).then(print);                                               //, event
  Future(() => Future(() => 12)).then(print);                                 //, event

  print('End');
}
//       READ:
//! MICROTASK:
//*     EVENT:
//?    OUTPUT: Start, End, 5, 7, 9, 1, 6, 8, 11, 10, 2, 12, 3, 4

//       READ:
//! MICROTASK:
//*     EVENT:
//?    OUTPUT: 1, 15, 2, 9, 14, 4, 5, 6, 8, 7, 10, 13, 11, 12, 3
// https://rutube.ru/video/1d22411540f537008cc1cd4d1b84a673/