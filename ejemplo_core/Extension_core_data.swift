//
//  Extension_core_data.swift
//  logeo
//
//  Created by Hansel on 26/10/21.
//

import Foundation
import UIKit
import CoreData

extension UIViewController {
    
    func obtener_contexto_core_data() -> NSManagedObjectContext {
        let contexto = UIApplication.shared.delegate as! AppDelegate
        return contexto.persistentContainer.viewContext
    }
    
}
