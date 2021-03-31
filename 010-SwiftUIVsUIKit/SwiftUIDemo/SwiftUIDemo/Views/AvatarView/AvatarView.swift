//
//  AvatarView.swift
//  SwiftUIDemo
//
//  Created by lephuongtien on 3/30/21.
//

import UIKit

protocol AvatarViewDelegate: class {
    func avatarView(avatarView: AvatarView, name: String)
}

class AvatarView: UIView {
    
    //MARK: Outlets
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    //MARK: Properties
    var name: String = "Noname"
    var color: UIColor = .blue
    
    weak var delegate: AvatarViewDelegate?
    
    //MARK: ConfigView
    func updateView() {
        nameLabel.text = name
        avatarImageView.tintColor = color
    }
    
    //MARK: Actions
    @IBAction func tap(_ sender: Any) {
        if let delegate = delegate {
            delegate.avatarView(avatarView: self, name: name)
        }
    }
    
}
