//
//  StudentTableView.swift
//  TableViewTask
//
//  Created by Saleh Bin Essa on 03/03/2024.
//

import Foundation

import UIKit

class StudentTableViewController: UITableViewController {
//    var student = ["Senior class", "Jonior class", "Sophomore class", "Freshmen class"]
    
    var studentsList: [Student] = [
        Student(name: "Saleh", gpa: 3.4, profileImage: "man"),
        Student(name: "Nawaf", gpa: 4.0, profileImage: "man")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentsList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        
        let student = studentsList[indexPath.row]

        // Configure the cell
        cell.textLabel?.text = "Student Name: \(student.name) - GPA: \(student.gpa)"
        cell.imageView?.image = UIImage(named: student.profileImage)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Deselect the row for visual feedback
        tableView.deselectRow(at: indexPath, animated: true)

        // Create an instance of DetailAccountViewController
        let detailVC = DetailStudentViewController()

        // Pass the selected bank account to the detail view controller
        let selectedStudent = studentsList[indexPath.row]
        detailVC.student = selectedStudent

        // Navigate to DetailAccountViewController
        navigationController?.pushViewController(detailVC, animated: true)
    }


}
