//
//  PrimeNumberAndFactors.swift
//  DataStructureAndAlgorithm_iOSTests
//
//  Created by Sandeep N on 17/06/19.
//  Copyright © 2019 fishTheData. All rights reserved.
//

import XCTest

class PrimeNumberAndFactors: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    let prime = PrimeNumber()

    func testPrimeFactors() {
        let fatorsList = ["12": [2, 2, 3],
                      "147": [3, 7, 7]]
        let factorInput = 12
        
        let primeFactors = prime.primeFactors(for: factorInput)
        // List of prime factors
        XCTAssertEqual(primeFactors.factors, fatorsList["\(factorInput)"], "Not valid factors")
    }
    
    func testPrimeNumbers() {
        let output = ["1": [0],
                      "2": [2],
                      "3": [2, 3],
                      "4": [2, 3],
                      "5": [2, 3, 5],
                      "7": [2, 3, 5, 7],
                      "11": [2, 3, 5, 7, 11],
                      "30": [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]]
        let primes = prime.primeNumbers(for: 7)
        XCTAssertEqual(primes, output["7"], "Not valid")
    }
    
    let outputs = ["1": 0, "2": 1, "3": 1, "500": 4, "5000": 5, "100000": 6, "10000000000": 10,
                   "595002220": 9,
                   "1518434302": 9,
                   "1777119607": 9,
                   "85088940": 8,
                   "209543572": 8,
                   "3513371": 7]
    let key = 595002220
    
    func testLeonardoUniquePrimeFactorCount_method1() {
        self.measure {
            let count = prime.leonardoPrimeFactors(for: key)
            XCTAssertEqual(count, outputs["\(key)"], "Not valid count")
        }
    }
    
    func testLeonardoUniquePrimeFactorCount_method2() {
        self.measure {
            let count = prime.leonardoPrimeFactors_updated(n: key)
            XCTAssertEqual(count, outputs["\(key)"], "Not valid count")
        }
    }
    
    func testLeonardoUniquePrimeFactorCount_method3() {
        self.measure {
            let maxValue = Int(pow(Double(10), Double(18)))
            let primes = prime.primeNumbers_updated(for: maxValue)
            print(primes)
            let count = prime.leonardoPrimeFactors_updated_fast(for: key, primes: primes)
            XCTAssertEqual(count, outputs["\(key)"], "Not valid count")
        }
    }

}
