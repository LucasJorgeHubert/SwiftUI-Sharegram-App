//
//  Presenter.swift
//  Sharegram
//
//  Created by Lucas Hubert on 08/04/25.
//

import Foundation

enum Presenter {
    enum TabBar {
        enum Feed { 
            enum Cell { }
        }
        enum Profile { }
        enum Search { }
        enum UploadPost { }
    }
    
    enum DirectMessage {
        enum BottomSheetNewChat { }
        enum Chat { }
        enum ChatList { }
    }
    
    enum Authentication {
        enum Login { }
        enum Registration { }
    }
    
    enum Root { }
}
