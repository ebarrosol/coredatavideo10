//
//  Principal.swift
//  CoreDataCustomObject
//
//  Created by Efren Alejandro Barroso Llanes on 14/06/15.
//  Copyright (c) 2015 EBL. All rights reserved.
//

import UIKit
import CoreData

class Principal: UIViewController {

    @IBOutlet var txtusuario: UITextField!
    @IBOutlet var txtcontrasena: UITextField!
    
    @IBAction func guardar()
    {
        let appdel : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let context : NSManagedObjectContext = appdel.managedObjectContext!
        
        let entsuario = NSEntityDescription.entityForName("Usuarios", inManagedObjectContext: context)
        
        var nvousuario = Usuarios(entity: entsuario!, insertIntoManagedObjectContext: context)
        
        nvousuario.usuario = txtusuario.text
        nvousuario.contrasena = txtcontrasena.text
        
        context.save(nil)
        
    }
    
    @IBAction func cargar()
    {
        let appdel : AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        
        let context : NSManagedObjectContext = appdel.managedObjectContext!
        
        var request = NSFetchRequest(entityName: "Usuarios")
        request.returnsObjectsAsFaults = false;
        request.predicate = NSPredicate(format: " usuario = %@ ", "\(txtusuario.text)")
        
        var results : NSArray = context.executeFetchRequest(request, error: nil)!
        if( results.count > 0)
        {
            
            for user in results
            {
                var usuario = user as! Usuarios
                //println("El nombre de usuario es \(usuario.usuario)")
                println("\(usuario.toString())")
                usuario.addFunnyPrefix("HaHa")
                println("\(usuario.toString())")
            }
            
        }
        else
        {
            println("0 resultados, posiblemente ocurrio un error")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
