//
//  Card.swift
//  Concetration
//
//  Created by Nikita Glavatskiy on 06/12/2017.
//  Copyright © 2017 Dreamers. All rights reserved.
//

import Foundation

struct Card
{
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
