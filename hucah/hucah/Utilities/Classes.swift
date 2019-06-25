//
//  Classes.swift
//  hucah
//
//  Created by Maxim Reshetov on 14/06/2019.
//  Copyright © 2019 Maxim Reshetov. All rights reserved.
//

import UIKit

class Discount {
    var discountName: String?
    var discountImageName: String?
    
    init(_ discountName: String?, _ discountImageName: String?) {
        self.discountName = discountName
        self.discountImageName = discountImageName
    }
}

class Menu {
    var menuName: String?
    var menuImageName: String?
    
    init(_ menuName: String?, _ menuImageName: String?) {
        self.menuName = menuName
        self.menuImageName = menuImageName
    }
}

func loadData() {
    discounts.append(Discount("1 + 1 = 3", "one_plus_one"))
    
    menu.append(Menu("Кальян на чаше", "hookah_cup"))
    menu.append(Menu("Кальян на фрукте", "hookah_fruit"))
    menu.append(Menu("Настольные игры", "board_games"))
    menu.append(Menu("Напитки", "beverages"))
}
