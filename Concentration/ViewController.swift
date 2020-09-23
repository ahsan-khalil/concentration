//
//  ViewController.swift
//  Concentration
//
//  Created by AhsanKhalil on 21/09/2020.
//  Copyright © 2020 AhsanKhalil. All rights reserved.
//

import UIKit

class CellClass : UITableViewCell{
    
}

class ViewController: UIViewController {

    //var emojiArray = ["🦇", "😱", "🙀", "😈", "🎃", "👻", "🍭", "🍬", "🍎"]
    
    let transparentView = UIView()
    let tableView = UITableView()
    var selectedButton = UIButton()
    var selectedThemeIndex = -1
    
    var datasource = [String]()
    
    /* UI Buttons */
    @IBOutlet weak var editTextUsername: UITextField!
    @IBOutlet weak var btnSelectTheme: UIButton!
    @IBOutlet weak var btnStartGame: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnStartGame.layer.cornerRadius = 5
        btnSelectTheme.layer.cornerRadius = 5
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CellClass.self, forCellReuseIdentifier: "Cell")
        
    }
    
    /*--- Blur the Front screen ---*/
    func addTransparentView(_ frames : CGRect){
        let window = UIApplication.shared.keyWindow
        transparentView.frame = window?.frame ?? self.view.frame
        self.view.addSubview(transparentView)
        self.view.addSubview(tableView)
        
        tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y, width: frames.height, height: 0)
        tableView.layer.cornerRadius = 5
        
        
        
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(removeTransparentView))
        transparentView.addGestureRecognizer(tapGesture)
        transparentView.alpha = 0
        
        
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1.0,initialSpringVelocity: 1.0,options: .curveEaseInOut,animations: {
            self.transparentView.alpha = 0.5
            self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height + 5, width: frames.width, height: CGFloat(self.datasource.count*50))
        },completion: nil)
        
        
    }
    
    
    
    @objc func removeTransparentView()
    {
        let frames = selectedButton.frame
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1.0,initialSpringVelocity: 1.0,options: .curveEaseInOut,animations: {
            self.transparentView.alpha = 0
        },completion: nil)
        
        self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height + 5, width: frames.width, height: 0)
        
    }
    
    
    /*---------------------------*/
    /*---------------------------*/
    /* Clickable functions Start */
    /*---------------------------*/
    /*---------------------------*/
    
    @IBAction func onClickSelectTheme(_ sender: Any) {
        selectedButton = btnSelectTheme
        datasource = []
        for ThemeList in ThemeList.EmojiLists{
            datasource.append("\(ThemeList.Name)  \(ThemeList.Emojies[0])")
        }
        addTransparentView(btnSelectTheme.frame)
    }
    @IBAction func onClickStartGame(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "gameViewController") as! GameViewController
                vc.modalPresentationStyle = .fullScreen
        vc.username = editTextUsername.text
        vc.selectedThemeIndex = self.selectedThemeIndex
        vc.selectedTheme = ThemeList.EmojiLists[selectedThemeIndex]
        present(vc,animated: true)
    }
    
    /*---------------------------*/
    /*---------------------------*/
    /* Clickable functions End   */
    /*---------------------------*/
    /*---------------------------*/
    
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedButton.setTitle(datasource[indexPath.row], for: .normal)
        selectedThemeIndex = indexPath.row
        removeTransparentView()
        //print("you tapped : \(indexPath)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = datasource[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}

