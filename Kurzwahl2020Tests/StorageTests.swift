//
//  StorageTests.swift
//  Kurzwahl2020Tests
//
//  Created by Andreas Vogel on 01.01.20.
//  Copyright © 2020 Vogel, Andreas. All rights reserved.
//

import XCTest
@testable import Kurzwahl2020

class StorageTests: XCTestCase {
    var sut : storage = storage()
    var testNames : [Int : String] = [0:"abc", 1:"def"]
    var testNumbers : [Int:String] = [0:"012", 1:"+49"]
    var testSettings : [String : String] = ["alpha" : "beta", "charlie": "delta"]
    let namesTestfile : String = "namesTestfile"
    let numbersTestfile : String = "numbersTestfile"
    let settingsTestfile : String = "settingsTestfile"

    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        let directory : URL = FileManager.sharedContainerURL()
        let fullPathNames = directory.appendingPathComponent(namesTestfile)
        let fullPathNumbers = directory.appendingPathComponent(numbersTestfile)
        let fullPathSettings = directory.appendingPathComponent(settingsTestfile)
        do {
            try FileManager.default.removeItem(at: fullPathNames)
            try FileManager.default.removeItem(at: fullPathNumbers)
            try FileManager.default.removeItem(at: fullPathSettings)
        } catch let error as NSError {
            print("Error: \(error.domain)")
        }
    }

    
    func testPersistForNames() {
        var result : [Int:String] = [0:""]
        sut.persist(withNames: testNames, withFilename: namesTestfile)
        result = sut.loadNames(withFilename: namesTestfile)
        
        XCTAssertTrue(result == testNames)
    }
    
    
    func testPersistForNumbers() {
        var result : [Int:String] = [0:""]
        sut.persist(withNumbers: testNumbers, withFilename: numbersTestfile)
        result = sut.loadNumbers(withFilename: numbersTestfile)
        
        XCTAssertTrue(result == testNumbers)
    }

    
    func testPersistForSettings() {
        var result : [String : String] = ["":""]
        sut.persist(settings: testSettings, withFilename: settingsTestfile)
        result = sut.loadSettings(withFilename: settingsTestfile)
        
        XCTAssertTrue(result == testSettings)
    }
    

}