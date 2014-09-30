import 'dart:core';

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

}

void main() {
  PrimeSieve sieve = new PrimeSieve(5);
  sieve.findPrimes().forEach((i) => print(i));
}