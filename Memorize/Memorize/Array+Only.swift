//
//  Array+Only.swift
//  Memorize
//
//  Created by Ethan Uzarowski on 6/3/20.
//  Copyright © 2020 Ethan Uzarowski. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
