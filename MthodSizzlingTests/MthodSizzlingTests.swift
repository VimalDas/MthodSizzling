//
//  MthodSizzlingTests.swift
//  MthodSizzlingTests
//
//  Created by Vimal Das on 11/11/23.
//

import XCTest

class MethodSizzlingExample {
    @objc dynamic func add(_ a: Int, _ b: Int) -> Int {
        a + b
    }
    @objc dynamic func multiply(_ a: Int, _ b: Int) -> Int {
        a * b
    }
}

class ResponsiveTest: XCTestCase {
    func test_checkMethodSizzling() {
        let objectSizzling = MethodSizzlingExample()
        print("before method sizzling: add function: \(objectSizzling.add(6, 65))")
        print("before method sizzling: multiply function: \(objectSizzling.multiply(6, 65))")
    
        let pointerAddmethod = class_getInstanceMethod(MethodSizzlingExample.self, #selector(MethodSizzlingExample.add))
        let pointerMultiplymethod = class_getInstanceMethod(MethodSizzlingExample.self, #selector(MethodSizzlingExample.multiply))

        method_exchangeImplementations(pointerAddmethod!, pointerMultiplymethod!)
        
        print("after method sizzling: add function: \(objectSizzling.add(6, 65))")
        print("after method sizzling: multiply function: \(objectSizzling.multiply(6, 65))")

    }
}
