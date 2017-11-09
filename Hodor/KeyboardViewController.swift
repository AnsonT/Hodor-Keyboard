//
//  KeyboardViewController.swift
//  Hodor
//
//  Created by Jono Muller on 05/06/2014.
//  Copyright (c) 2014 Jonathan Muller. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    @IBOutlet var hodorButton: UIButton!

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system) as UIButton
    
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next keyboard", comment: "Title for 'Next Keyboard' button"), for: .normal)
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false

        
        self.nextKeyboardButton.titleLabel!.font = UIFont(name: "Helvetica", size: 10)
    
        self.nextKeyboardButton.addTarget(self, action: #selector(UIInputViewController.advanceToNextInputMode), for: .touchUpInside)
        
        self.view.addSubview(self.nextKeyboardButton)
    
        let nextKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1.0, constant: 0.0)
        let nextKeyboardButtonBottomConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        self.view.addConstraints([nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint])
        
        // Hodor button
        
        self.hodorButton = UIButton(type: .system) as UIButton
        
        self.hodorButton.setTitle(NSLocalizedString("Hodor", comment: "Hodor button"), for: .normal)
        self.hodorButton.sizeToFit()
        self.hodorButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.hodorButton.titleLabel!.font = UIFont(name: "Helvetica", size: 50)
        
        self.hodorButton.addTarget(self, action: #selector(KeyboardViewController.hodor), for: .touchUpInside)
        
        self.view.addSubview(self.hodorButton)
        
        let hodorButtonCenterXConstraint = NSLayoutConstraint(item: self.hodorButton, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        let hodorButtonCenterYConstraint = NSLayoutConstraint(item: self.hodorButton, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        self.view.addConstraints([hodorButtonCenterXConstraint, hodorButtonCenterYConstraint])
    }
    
    @objc func hodor() {
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        proxy.insertText("Hodor ")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    
        var textColor: UIColor
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: .normal)
        self.hodorButton.setTitleColor(textColor, for: .normal)
    }

}
