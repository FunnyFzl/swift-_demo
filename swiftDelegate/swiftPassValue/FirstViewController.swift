//
//  FirstViewController.swift
//  swiftDelegate
//
//  Created by funny on 2018/8/31.
//  Copyright © 2018年 Funny. All rights reserved.
//

import UIKit

/*
 swift代理传值的总结
 一、正向传值直接给属性赋值即可
 二、反向代理传值：
               1、可选的代理方法：@objc optional 还需要在protocol前加@objc
               2、因为如果代理方法是可选的，那么调用的时候在调用方法后添加？或者！表示可选调用


 补充：
 1、在方法的func关键字之前加上关键字static或者class都可以用于指定类方法.不同的是用class关键字指定的类方法可以被子类重写，但是static关键字指定的类方法是不能被子类重写的，被static指定的类方法包含final（不可更改的）关键字的特性--防止被重写.
 2、deinit属于析构函数
 析构函数(destructor) 与构造函数相反，当对象结束其生命周期时（例如对象所在的函数已调用完毕），系统自动执行析构函数
 和OC中的dealloc 一样的

 */

class FirstViewController: UIViewController,passValueDelegate {

    var nameAge: String?



    deinit {//移除通知
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "NotificationPassValue"), object: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(PassValue), name: NSNotification.Name(rawValue: "NotificationPassValue"), object: nil)
    }

    @objc func PassValue(sender: NSNotification) -> () {
        let name: String = "通知传值：" + (sender.object as! String)
        print(name)
    }

    @IBAction func tipPush(_ sender: Any) {

        let secondVC = SecondViewController()
        secondVC.name = "刘强东"
        secondVC.age = 48
        secondVC.passdelegate = self
        navigationController?.pushViewController(secondVC, animated: true)
        secondVC.passclouse = {(name: String) -> () in
            print(name)
        }

    }

    func passVaule(name: String?, age: Int) {
        print(name ?? "",age)
    }

    func passString(name: String, age: Int) -> (String) {
//        let nameAgeString = name + "的年龄是" + String(age)
        let nameAgeString02 = "\(name) 的年龄是\(age)"
        return nameAgeString02
    }
}




