//
//  PrimeNumbers.swift
//  DataStructureAndAlgorithm_iOS
//
//  Created by Sandeep N on 17/06/19.
//  Copyright © 2019 fishTheData. All rights reserved.
//

import Foundation

extension Int {
    func isDivisible(by value: Int) -> Bool {
        return (self % value == 0)
    }
}

class PrimeNumber {
    
    func primeFactors(for n: Int) -> (factors: [Int], uniqueFactors: Set<Int>) {
        let primes = primeNumbers(for: n)
        var factors = [Int]()
        var uniqueFactors = Set<Int>()
        var number = n
        while number > 1 {
            let factor = getFactor(for: number, primes: primes)
            if number == factor.nextNumber {
                return ([number], [number])
            }
            number = factor.nextNumber
            factors.append(factor.factor)
            uniqueFactors.insert(factor.factor)
        }
        return (factors, uniqueFactors)
    }
    
    func getFactor(for n: Int, primes: [Int]) -> (factor: Int, nextNumber: Int) {
        for prime in primes {
            if n % prime == 0 {
                let next = n / prime
                return (prime, next)
            }
        }
        return (n, n)
    }
    
    /**
     Get list of prime numbers.
     */
    func primeNumbers(for n: Int) -> [Int] {
        // first prime number is 2
        if n < 2 {
            return [0]
        } else if n == 2 {
            return [2]
        }
        var primes = [2, 3]
        if n == 3 {
            return primes
        }
        var value = 4
        // all even numbers except 2 are composites
        while value <= n {
            // odd numbers -> check for divisibility
            if value % 2 != 0 {
                var isDivisible = false
                for element in primes where value.isDivisible(by: element) {
                    // it is a prime number
                    //                    print("element: \(element) ---- value: \(value)")
                    isDivisible = true
                    break
                }
                if !isDivisible {
                    primes.append(value)
                }
            }
            value = value + 1
            //            print("value: \(value)")
        }
        return primes
    }
    
    /**
     Find number of prime numbers such that when multiplied with each prime number is less than given number n
     eg: Given input 700
     prime numbers are: 2, 3, 5, 7, 11, 13 and so on.
     when multiplied => 2*3*5*7 = 210
                        210*11 = 2310 which is greater than given number 700
                        => Number of prime numbers are 2, 3, 5, 7 => 4 count (this is valid for n <= 2310)
     */
    // Method - 1
    func leonardoPrimeFactors(for n: Int) -> Int {
        let primes = primeNumbers(for: n)
        var total = 1
        var factors = [Int]()
        for prime in primes {
            total = total * prime
            if total > n {
                break
            }
            factors.append(prime)
        }
        return factors.count
    }
    
    // Method - 2
    func leonardoPrimeFactors_updated(n: Int) -> Int {
        if n < 2 {
            return 0
        } else if n == 2 {
            return 1
        }
        var primes = [2]
        var factors = [2]
        var value = 2
        var total = 2
        // all even numbers except 2 are composites
        while value <= n {
            // odd numbers -> check for divisibility
            if value % 2 != 0 {
                var isDivisible = false
                for element in primes where value.isDivisible(by: element) {
                    // it is a prime number
                    isDivisible = true
                    break
                }
                if !isDivisible {
                    primes.append(value)
                    total = total * value
                    if total > n {
                        break
                    }
                    factors.append(value)
                }
            }
            value = value + 1
        }
        return factors.count
    }
    
    // Method - 3
    func leonardoPrimeFactors_updated_fast(for n: Int, primes: [Int]) -> Int {
        //let primes = primeNumbers(for: n)
        var total = 1
        var factors = [Int]()
        for prime in primes {
            total = total * prime
            if total > n {
                break
            }
            factors.append(prime)
        }
        return factors.count
    }
    
    func primeNumbers_updated(for n: Int) -> [Int] {
        if n < 2 {
            return [0]
        } else if n == 2 {
            return [2]
        }
        var primes = [2]
        var value = 2
        var total: UInt64 = 2
        // all even numbers except 2 are composites
        while value <= n {
            // odd numbers -> check for divisibility
            if value % 2 != 0 {
                var isDivisible = false
                for element in primes where value.isDivisible(by: element) {
                    // it is a prime number
                    isDivisible = true
                    break
                }
                if !isDivisible {
                    primes.append(value)
                    let val = total * UInt64(value)
                    if val > n {
                        break
                    }
                    total = val
                }
            }
            if (UInt64(n) - total) < total {
                /*
                 Blocking overflow
                 */
                break
            }
            value = value + 1
        }
        return primes
    }
}


