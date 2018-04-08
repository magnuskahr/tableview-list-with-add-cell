//
//  TextfieldCell.swift
//  tableview-list-with-add-cell
//
//  Created by Magnus Jensen on 08/04/2018.
//  Copyright © 2018 Magnus Jensen. All rights reserved.
//

import UIKit

class TextfieldCell: UITableViewCell, UITextFieldDelegate {
    
    var resignationHandler: (() -> Void)?
    
    @IBOutlet weak var textfield: UITextField! {
        didSet {
            textfield.delegate = self
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        resignationHandler?()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textfield.resignFirstResponder()
        return true
    }
}
