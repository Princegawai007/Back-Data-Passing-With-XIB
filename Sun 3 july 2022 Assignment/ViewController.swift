//
//  ViewController.swift
//  Sun 3 july 2022 Assignment
//
//  Created by Prince's Mac on 03/07/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var noDataLabel: UILabel!
    @IBOutlet weak var studentDetailsTableView: UITableView!
    
    var students : [StudentModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        studentDetailsTableView.dataSource = self
        studentDetailsTableView.delegate = self
        
        noDataLabel.isHidden = false
        studentDetailsTableView.isHidden = true
        
       let uiNib = UINib(nibName: "StudentTableViewCell", bundle: nil)
        self.studentDetailsTableView.register(uiNib, forCellReuseIdentifier: "StudentTableViewCell")
    }

    @IBAction func addStudentRecordOnBtnClick(_ sender: Any) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController
        secondViewController?.delegateSVC = self         // IMPORTANT METHOD TO PROVIDE
        self.navigationController?.pushViewController(secondViewController!, animated: true)
    }
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let studentCell = self.studentDetailsTableView.dequeueReusableCell(withIdentifier: "StudentTableViewCell", for: indexPath)as! StudentTableViewCell
        let eachStudents = students[indexPath.row]
        studentCell.studentNameLabel.text = eachStudents.studentName
        studentCell.studentRollNumberLabel.text = String(eachStudents.studentRollNumber)
        studentCell.studentCityLabel.text = (eachStudents.studentCity)
        return studentCell
    }
}
extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete)
        {
            studentDetailsTableView.beginUpdates()
            students.remove(at: indexPath.row)
            studentDetailsTableView.deleteRows(at: [indexPath], with: .fade)
            studentDetailsTableView.endUpdates()
        }
    }
}
    extension ViewController: StudentDataPassingProtocol{
        func passStudentData(student: StudentModel) {
            let student = StudentModel(studentName: student.studentName, studentRollNumber: student.studentRollNumber, studentCity: student.studentCity)
            students.append(student)
            noDataLabel.isHidden = true
            studentDetailsTableView.isHidden = false
            studentDetailsTableView.reloadData()
        }
}

