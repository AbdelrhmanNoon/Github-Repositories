//
//  Git_Repositories_SearchTests.swift
//  Git-Repositories-SearchTests
//
//  Created by AbdulrhmanNoon on 2023-10-20.
//

import XCTest
@testable import Git_Repositories_Search

class Git_Repositories_SearchTests: XCTestCase {
    
    var networkingManager: NetworkManager!

       override func setUp() {
           super.setUp()
           networkingManager = NetworkManager() // Initialize your networking manager
       }
    
    
    override func tearDown() {
           networkingManager = nil
           super.tearDown()
       }

       func testGetAllRepositories() {
           let expectation = XCTestExpectation(description: "Fetching repositories")

           networkingManager.getAllRepositories { repositories in
               // Assert that the received repositories are not empty
               XCTAssertFalse(repositories.isEmpty)

               // You can add more assertions or checks on the received repositories as needed

               expectation.fulfill()
           }

           wait(for: [expectation], timeout: 10.0) // Adjust the timeout if necessary
       }

 
    func testConfigureWithRepo() {
        // Create a sample SearchResultModel instance for testing
        let repo = SearchResultModel(
            owner: Owner(avatar_url: "https://example.com/avatar.png", login: "TestUser"),
            name: "TestRepo",
            description: "Test repository",
            stargazers_count: 10,
            language: "Swift"
        )
        
        XCTAssertEqual(repo.owner.login, "TestUser")
        XCTAssertEqual(repo.name, "TestRepo")
        XCTAssertEqual(repo.description, "Test repository")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
