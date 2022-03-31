//
//  PetDirectoryTests.swift
//  PetDirectoryTests
//
//  Created by Decagon on 25/03/2022.
//

import XCTest
@testable import PetDirectory

class PetDirectoryTests: XCTestCase {

    func testing_viewLoadingForAllDogsViewController() {
        let sut = AllDogsViewController()
        XCTAssertFalse(sut.isViewLoaded)
    }
    
    func testing_viewLoadingForDogsILikeViewController() {
        let sut = DogsILikeViewController()
        XCTAssertFalse(sut.isViewLoaded)
    }
    
    func test_checkingNetworkConnection() {
        let sut = UserDefaults.self
        XCTAssert((sut.standard.object(forKey: "dogFavorite") != nil))
    }

}
