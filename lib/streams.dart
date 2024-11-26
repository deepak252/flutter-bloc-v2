// ignore_for_file: avoid_print

// Async Generator Function
Stream<int> boatStream() async* {
  for(int i=1; i<=10; i++){
    print("Sent boat no. : $i");
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}

void main(){
  Stream<int> stream = boatStream();

  stream.listen((data){
    print("Received boat no. : $data");
  });
}