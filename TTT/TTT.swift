//
//  TTT.swift
//  TTT
//
//  Created by Safa Falaqi on 03/12/2021.
//

import Foundation


class TTT{
    
    public enum GameState : String {
          case redTurn = "Red Turn"
          case blueTurn = "Blue Turn"
          case tie = "Game Tie"
          case redWin = "Red Wins"
          case blueWin = "Blue Wins"
      }
    
    // 2 dimensional array of arrays of char set to 'a'. Arrays size is 3x 3
    //player 1 = r
    //player 2 = b
    public var board = [[String]](repeating: [String](repeating: "a", count: 3), count: 3)
   
    private let winningPositions = [
                                [[1,1,1],[0,0,0],[0,0,0]],
                                [[0,0,0],[1,1,1],[0,0,0]],
                                [[0,0,0],[0,0,0],[1,1,1]],

                                [[1,0,0],[1,0,0], [1,0,0]],
                                [[0,1,0],[0,1,0], [0,1,0]],
                                [[0,0,1],[0,0,1], [0,0,1]],

                                [[1,0,0],[0,1,0], [0,0,1]],
                                [[0,0,1],[0,1,0], [1,0,0]],
                                ]
    
    
    //here we will check for game state if any player wins
    public func checkState() -> GameState {
        if winnerCheck(char: "r") {
            //check if r = Red is the winner
                  return .redWin
            
              } else if winnerCheck(char: "b")  {    //check if b = blue is the winner
                  return .blueWin
              } else {
                  var rCount = 0
                  var bCount = 0
                  var emptyCount = 0
                  for i in 0..<3 {
                      for j in 0..<3 {
                          switch board[i][j] {
                          case "r": // Red
                              rCount += 1
                          case "b": // Blue
                              bCount += 1
                          default: //empty
                              emptyCount += 1
                          }
                      }
                  }
                  //if game tie
                  if emptyCount == 0 {
                      return .tie
                  } else if rCount > bCount {
                      //if red count is more it means blue turn
                      return .blueTurn
                  } else {
                      //otherwise it s red turn
                      return .redTurn
                  }
              }
        
        
    }
    
    
     func winnerCheck(char: String) -> Bool {
           var counter = 0
           for winning in winningPositions {
               counter = 0
               //if in each board counter = 3 it means win
               for i in 0..<3 {
                   for j in 0..<3 {
                       if winning[i][j] == 1 {
                           if board[i][j] == char {
                               counter += 1
                           }
                       }
                   }
               }
               if (counter == 3) {
                   return true
               }
           }
           return false
       }
    
    func resetBoard(){
        board = [[String]](repeating: [String](repeating: "a", count: 3), count: 3)
    }
    
}
