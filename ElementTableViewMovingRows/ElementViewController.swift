//
//  ViewController.swift
//  ElementTableView
//
//  Created by Ani Adhikary on 18/11/17.
//  Copyright © 2017 Ani Adhikary. All rights reserved.
//
// https://www.ralfebert.de/tutorials/ios-swift-uitableviewcontroller/reorderable-cells/

import UIKit

class ElementViewController: UIViewController {
 
    @IBOutlet weak var elementTable: UITableView!
    
    var elements = [Element]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadElements()
        //Step 1
        //This line will enable editing onload
        //elementTable.isEditing = true
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    func loadElements() {
        elements = [
            Element(elementName: "Hydrogen", elementSymbol: "H"),
            Element(elementName: "Helium", elementSymbol: "He"),
            Element(elementName: "Lithium", elementSymbol: "Li"),
            Element(elementName: "Beryllium", elementSymbol: "Be"),
            Element(elementName: "Boron", elementSymbol: "B"),
            Element(elementName: "Carbon", elementSymbol: "C"),
            Element(elementName: "Nitrogen", elementSymbol: "N"),
            Element(elementName: "Oxygen", elementSymbol: "O"),
            Element(elementName: "Fluorine", elementSymbol: "F"),
            Element(elementName: "Neon", elementSymbol: "Ne"),
            Element(elementName: "Sodium", elementSymbol: "Na"),
            Element(elementName: "Magnesium", elementSymbol: "Mg"),
            Element(elementName: "Aluminum", elementSymbol: "Al"),
            Element(elementName: "Silicon", elementSymbol: "Si"),
            Element(elementName: "Phosphorus", elementSymbol: "P"),
            Element(elementName: "Sulfur", elementSymbol: "S"),
            Element(elementName: "Chlorine", elementSymbol: "Cl"),
            Element(elementName: "Argon", elementSymbol: "Ar"),
            Element(elementName: "Potassium", elementSymbol: "K"),
            Element(elementName: "Calcium", elementSymbol: "Ca"),
            Element(elementName: "Scandium", elementSymbol: "Sc")
        ]
    }
}

extension ElementViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let elementCell = tableView.dequeueReusableCell(withIdentifier: "ElementCell", for: indexPath)
        
        let element = elements[indexPath.row]
        elementCell.textLabel?.text = element.elementName
        elementCell.detailTextLabel?.text = element.elementSymbol
        return elementCell
    }
    
    //Step 2
    //Removing the red delete button this is used
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    //Removing the red delete button this is used
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    
    //Step 4
    //Actual Implementation for moving
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = self.elements[sourceIndexPath.row]
        elements.remove(at: sourceIndexPath.row)
        elements.insert(movedObject, at: destinationIndexPath.row)
        //NSLog("%@", "\(sourceIndexPath.row) => \(destinationIndexPath.row) \(elements)")
        // To check for correctness enable: self.tableView.reloadData()
    }

    //Allow only elements starting with letter H to be moved
//    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        let rowData = elements[indexPath.row]
//        return rowData.elementName.hasPrefix("H")
//    }
    
    //Step 3 - To enable editing on click of the Edit Button
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        if editing {
            elementTable.setEditing(true, animated: true)
        } else {
            elementTable.setEditing(false, animated: true)
        }
    }
}
