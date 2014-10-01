import 'dart:core';
import 'package:unittest/unittest.dart';

class PrimeSieve {
  int max;

  PrimeSieve(this.max);

  List<int> findPrimes() {
    List<int> primes = new Iterable.generate(this.max - 1, (i) => i + 2).toList();
    for (int index=0;index < primes.length;index++) {
      int floor = primes[index];
      for (int j=index+1;j<primes.length;j++) {
        if (primes[j] % floor == 0) {
          primes.removeAt(j);
        }
      }
    }
    return primes;
  }

  List<int> findPrimesDartLike() {

    List<int> allNumbers = new Iterable.generate(this.max - 1, (i) => i + 2).toList();

    List<int> foundPrimes = new List();

    Stopwatch watch = new Stopwatch()..start();
    print("generate took:" + watch.elapsed.toString());
    while (!allNumbers.isEmpty) {
      int prime = allNumbers.removeAt(0);
      foundPrimes.add(prime);
      allNumbers.removeWhere((i) => i % prime == 0);
    }
    return foundPrimes;
  }
}

void main() {
  test("should equal", () {
    PrimeSieve sieve = new PrimeSieve(20000);
    Stopwatch stopwatch = new Stopwatch()..start();
    int oldCount = sieve.findPrimes().length;
    print(oldCount);
    print("old one in:" + stopwatch.elapsed.toString());

    stopwatch.reset();
    int dartCount = sieve.findPrimesDartLike().length;
    print(dartCount);
    print("new one in:" + stopwatch.elapsed.toString());
    expect(oldCount, equals(dartCount));
  });
}
