//
//  ItinerariesController.swift
//  trazaqui-iphone
//
//  Created by Yuri Mello on 30/11/16.
//  Copyright © 2016 Yuri Mello. All rights reserved.
//

import UIKit
import SwiftyJSON

class PlacesController: TableViewController {
    let childController: ItemsController = ItemsController()
    
    override func selectCell(indexPath: IndexPath){
        childController.resetData()
        processChildren(indexPath: indexPath)
        showChildTable(childController)
    }
    
    
    override func processChildren(indexPath: IndexPath){
        
        for child in children[indexPath.row].array!{
            childController.addJSONObject(child, labelName: "name")
        }
    }
}
