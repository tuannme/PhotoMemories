//
//  TabbarItemHijackContext.swift
//  PhotoMemories
//
//  Created by nguyen.manh.tuanb on 7/11/18.
//  Copyright © 2018 Nguyen Manh Tuan. All rights reserved.
//

import Foundation
import ESTabBarController_swift

final class TabbarItemHijackContext: ESTabBarItemContentView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.contentMode = .scaleAspectFit
        self.itemContentMode = .alwaysOriginal
        iconColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        highlightIconColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
