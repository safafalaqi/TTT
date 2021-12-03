//
//  ViewController.swift
//  TTT
//
//  Created by Safa Falaqi on 03/12/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bt_1: UIButton!
    @IBOutlet weak var bt_2: UIButton!
    @IBOutlet weak var bt_3: UIButton!
    @IBOutlet weak var bt_4: UIButton!
    @IBOutlet weak var bt_5: UIButton!
    @IBOutlet weak var bt_6: UIButton!
    @IBOutlet weak var bt_7: UIButton!
    @IBOutlet weak var bt_8: UIButton!
    @IBOutlet weak var bt_9: UIButton!
    @IBOutlet var statusLabel: UILabel!
    
    var tttGame = TTT()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateState()
    }
    func updateState() {
        statusLabel.text = tttGame.checkState().rawValue
        }

    @IBAction func resetGame(_ sender: UIButton) {
        tttGame.resetBoard()
        resetGame()
        updateState()
    }
    
    @IBAction func buttonPressed(sender: UIButton){
        switch tttGame.checkState(){
        case .redTurn:
            sender.backgroundColor = UIColor.red
            sender.isEnabled = false
            tttGame.board[checkIndex(button: sender).first!][checkIndex(button: sender).last!] = "r"
            updateState()
            
        case .blueTurn:
            sender.backgroundColor = UIColor.blue
            sender.isEnabled = false
            tttGame.board[checkIndex(button: sender).first!][checkIndex(button: sender).last!] = "b"
            updateState()
            
        case .redWin:
            updateState()
        case .blueWin:
            updateState()
        default :
            updateState()
            
        }
        
    }
    
    func checkIndex(button:UIButton) ->[Int]{
        switch button {
        case bt_1: return [0,0]
        case bt_2: return [0,1]
        case bt_3: return [0,2]
        case bt_4: return [1,0]
        case bt_5: return [1,1]
        case bt_6: return [1,2]
        case bt_7: return [2,0]
        case bt_8: return [2,1]
        default : return [2,2]
        }
    }
    
    func resetGame(){
        bt_1.backgroundColor = UIColor.gray
        bt_2.backgroundColor = UIColor.gray
        bt_3.backgroundColor = UIColor.gray
        bt_4.backgroundColor = UIColor.gray
        bt_5.backgroundColor = UIColor.gray
        bt_6.backgroundColor = UIColor.gray
        bt_7.backgroundColor = UIColor.gray
        bt_8.backgroundColor = UIColor.gray
        bt_9.backgroundColor = UIColor.gray
        
        bt_1.isEnabled = true
        bt_2.isEnabled = true
        bt_3.isEnabled = true
        bt_4.isEnabled = true
        bt_5.isEnabled = true
        bt_6.isEnabled = true
        bt_7.isEnabled = true
        bt_8.isEnabled = true
        bt_9.isEnabled = true
        
    }
    
}

