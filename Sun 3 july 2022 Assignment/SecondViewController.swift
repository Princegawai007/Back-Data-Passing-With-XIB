//
//  SecondViewController.swift
//  Sun 3 july 2022 Assignment
//
//  Created by Prince's Mac on 03/07/22.
//

import UIKit
protocol BackDataPassingProtocol {
func passData(textToPass : String?)
}
class SecondViewController: UIViewController {
    @IBOutlet weak var studentNameTextField: UITextField!
    @IBOutlet weak var studentRollNumberTextField: UITextField!
    @IBOutlet weak var studentCityTextField: UITextField!
    
    var delegateSVC : StudentDataPassingProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPlaceHolders()
        // Do any additional setup after loading the view.
    }
    func setPlaceHolders(){
        self.studentRollNumberTextField.placeholder = "Enter Roll Number"
    }
    
    @IBAction func saveData(_ sender: Any) {
        
        guard let  delegate = delegateSVC else {
            return
        }
        if self.studentNameTextField.text!.isEmpty || self.studentRollNumberTextField.text!.isEmpty ||
            self.studentCityTextField.text!.isEmpty {
            
            let dataAlertController = UIAlertController(title: "Student Data", message: "Please Enter Data", preferredStyle: .alert)
            let actionOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
            let cancleAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            
            dataAlertController.addAction(actionOk)
            dataAlertController.addAction(cancleAction)
            self.present(dataAlertController,animated: true, completion: nil)
    }
    else {
        let studentName = self.studentNameTextField.text ?? "Name"
        let studentRollNumber = self.studentRollNumberTextField.text ?? "0"
        let studentCity = self.studentCityTextField.text ?? " City"
        
        let objectToPass = StudentModel(studentName: studentName, studentRollNumber: Int(studentRollNumber) ?? 0, studentCity: studentCity)
        
        let saveAlertController = UIAlertController(title: "Save Data", message: "Data Saved Succesfully", preferredStyle: .alert)
        
        let defaultActionOk = UIAlertAction(title: "Ok", style: .default){ (next) in
            delegate.passStudentData(student: objectToPass)
            
            self.navigationController?.popViewController(animated: true)
        }
        
        saveAlertController.addAction(defaultActionOk)
        self.present(saveAlertController, animated: true, completion: nil)
    }
  }
}
