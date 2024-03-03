//
//  DetailStudentViewController.swift
//  TableViewTask
//
//  Created by Saleh Bin Essa on 03/03/2024.
//

import Foundation

import UIKit
import SnapKit

class DetailStudentViewController: UIViewController {
    // Property to hold the bank account details passed from the previous view
    var student: Student?

    // UI Components
    private let studentNameLabel = UILabel()
    private let gpaLabel = UILabel()
    private let profileImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayout()
        configureWithStudent()
    }

    private func setupViews() {
        view.backgroundColor = .white

        studentNameLabel.font = .systemFont(ofSize: 16, weight: .medium)
        gpaLabel.font = .systemFont(ofSize: 16, weight: .medium)

        // Add the views to the hierarchy
        view.addSubview(studentNameLabel)
        view.addSubview(gpaLabel)
        view.addSubview(profileImageView)
    }

    private func setupLayout() {
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(100)  // Example size, adjust as needed
        }

        studentNameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }

        gpaLabel.snp.makeConstraints { make in
            make.top.equalTo(studentNameLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }

    private func configureWithStudent() {
        studentNameLabel.text = "Student Name: \(student?.name ?? "N/A")"
        gpaLabel.text = "GPA: \(student?.gpa ?? 0.0)"
      profileImageView.image = UIImage(named: student?.profileImage ?? "image")
    }
}
