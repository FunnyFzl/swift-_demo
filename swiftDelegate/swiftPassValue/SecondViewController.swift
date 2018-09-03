//
//  SecondViewController.swift
//  swiftDelegate
//
//  Created by funny on 2018/8/31.
//  Copyright © 2018年 Funny. All rights reserved.
//

import UIKit

@objc protocol passValueDelegate {

    func passVaule(name: String?, age: Int)
    @objc optional func passString(name: String, age: Int) -> (String)
}

class SecondViewController: UIViewController {

    var name: String?
    var age: Int?
    var passdelegate:passValueDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        print(name ?? "")

        print(age ?? 0)

        let backButton: UIButton = UIButton.init(type: .custom)
        backButton.frame = CGRect.init(x: 100, y: 300, width: 175, height: 100)
        backButton.backgroundColor = .red
        backButton.setTitle("返回", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        view.addSubview(backButton)
    }

    @objc func backAction(sender: UIButton) -> () {
        passdelegate?.passVaule(name: name, age: age!)
        let namestring = passdelegate?.passString!(name: name!, age: age!)
        print(namestring ?? "")
        navigationController?.popViewController(animated: true)
    }
}
