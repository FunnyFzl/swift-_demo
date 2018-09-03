//
//  SecondViewController.swift
//  swiftDelegate
//
//  Created by funny on 2018/8/31.
//  Copyright © 2018年 Funny. All rights reserved.
//

import UIKit

enum NotificationName {
    case PassValue
}

@objc protocol passValueDelegate {

    func passVaule(name: String?, age: Int)
    @objc optional func passString(name: String, age: Int) -> (String)
}

typealias passClouse = (String) -> ()

class SecondViewController: UIViewController {

    var name: String?
    var age: Int?
    var passdelegate:passValueDelegate?
    var passclouse: passClouse?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        print(name ?? "")

        print(age ?? 0)

        view.addSubview(backButton)
    }

    @objc func backAction(sender: UIButton) -> () {

        //代理
        passdelegate?.passVaule(name: name, age: age!)

        let namestring = passdelegate?.passString!(name: name!, age: age!)
        print(namestring ?? "")

        //闭包
        if passclouse != nil {
            let nameAgeString = "闭包传值：" + self.name! + "的年龄是" + String(age!)
            passclouse!(nameAgeString)
        }

        //通知
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "NotificationPassValue"), object: namestring)

        navigationController?.popViewController(animated: true)
    }


    let backButton: UIButton = {
        let backButton = UIButton.init(type: .custom)
        backButton.frame = CGRect.init(x: 100, y: 300, width: 175, height: 100)
        backButton.backgroundColor = .red
        backButton.setTitle("返回", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        return backButton
    }()
}
