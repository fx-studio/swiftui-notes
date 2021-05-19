//
//  FXKeyboardManager.swift
//  BuildingBlockDemo
//
//  Created by lephuongtien on 5/19/21.
//

import Foundation
import SwiftUI

class FXKeyboardManager : ObservableObject {
    @Published var customHeight: CGFloat = 0
    @Published var keyboardHeight: CGFloat = 0
    @Published var isVisible = false
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardVisibilityChanged), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc private func keyboardVisibilityChanged(_ notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        guard let keyboardEndFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        
        isVisible = keyboardEndFrame.minY < UIScreen.main.bounds.height
        
        keyboardHeight = isVisible ? keyboardEndFrame.height : 0
        
        keyboardHeight = customHeight == 0 ? keyboardHeight : customHeight

    }
}
