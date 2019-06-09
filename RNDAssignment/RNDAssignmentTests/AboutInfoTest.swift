//
//  AboutInfoTest.swift
//  RNDAssignmentTests
//
//  Created by Deni Smilevska on 6/9/19.
//  Copyright © 2019 Deni Smilevska. All rights reserved.
//

import XCTest
@testable import RNDAssignment

class AboutInfoTest: XCTestCase {

    func loadAboutInfo(){
        let model : AboutModel = Model()
        let presenter : AboutPresenter = Presenter(view: nil, model: model)
        presenter.loadAboutInfo()
        
    }

}
