//
//  Concentration.swift
//  Concetration
//
//  Created by Nikita Glavatskiy on 06/12/2017.
//  Copyright © 2017 Dreamers. All rights reserved.
//

import Foundation

class Concentration
{
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices{
                if cards[index].isFaceUp{
                    if foundIndex == nil {
                        foundIndex = index
                    }else{
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int){
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            }else{
                // either no card or 2 cards are face up
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
      
    init(numberOfPairsOfCards: Int){
        assert(numberOfPairsOfCards>0, "Concentatrion.init(\(numberOfPairsOfCards): you must have at least one pair of cards")
        var generatedCards = [Card]()
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            generatedCards += [card, card]
        }
        // TODO: Shuffle the cards
        for _ in generatedCards{
            cards.append(generatedCards.remove(at: Int(arc4random_uniform(UInt32(generatedCards.count)))))
        }
        
    }
}
