//
//  Usuarios.swift
//  CoreDataCustomObject
//
//  Created by Efren Alejandro Barroso Llanes on 14/06/15.
//  Copyright (c) 2015 EBL. All rights reserved.
//

import UIKit
import CoreData

@objc(Usuarios)

class Usuarios: NSManagedObject
{
    @NSManaged var usuario: String
    @NSManaged var contrasena: String
    
    func toString() -> String
    {
        return "El nombre de usuario es \(usuario). Su contraseña es \(contrasena)"
    }
    
    func addFunnyPrefix(_prefix: String)
    {
        usuario = "\(_prefix) \(usuario)"
    }
    
}
