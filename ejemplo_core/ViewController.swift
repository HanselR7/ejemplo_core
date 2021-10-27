//
//  ViewController.swift
//  ejemplo_core
//
//  Created by Hansel on 26/10/21.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var textNombre: UITextField!
    @IBOutlet weak var textEdad: UITextField!
    @IBOutlet weak var areaNombre: UITextView!
    
    var registros_guardados = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func Agregar_press(_ sender: Any) {
        let nombre = textNombre.text!
        let edad = Int(textEdad.text!)
        
        do {
            let contexto = obtener_contexto_core_data()
            let nuevo_objeto = NSEntityDescription.insertNewObject(forEntityName: "Alumno", into: contexto)
            nuevo_objeto.setValue("\(1)", forKey: "id")
            nuevo_objeto.setValue(nombre, forKey: "nombre")
            nuevo_objeto.setValue(edad, forKey: "edad")
            
            try contexto.save()
            
            /*let contexto = obtener_contexto_core_data()
            let solicitud_agregar = NSFetchRequest<NSFetchRequestResult>(entityName: "Alumno")
            let result = try contexto.fetch(solicitud_agregar) as? [NSManagedObject]
             */
        } catch {
            print("Error")
        }
        
        ver_registros()
    }
    
    func ver_registros() {
        let contexto = obtener_contexto_core_data()
        let solicitud_busqueda = NSFetchRequest<NSFetchRequestResult>(entityName: "Alumno")
        do {
            let registros = try contexto.fetch(solicitud_busqueda)
            var cadena_mostrar = String()
            for item in registros {
                let temp = item as! NSManagedObject
                let id_obtenido = temp.value(forKey: "id")!
                let nombre_obtenido = temp.value(forKey: "nombre")!
                let edad_obtenido = temp.value(forKey: "edad")!
                cadena_mostrar = cadena_mostrar + "\(id_obtenido)" + "\(nombre_obtenido)" + "\(edad_obtenido)\n"
            }
            areaNombre.text = cadena_mostrar
        } catch {
            print("Error al leer los datos")
        }
    }

}

