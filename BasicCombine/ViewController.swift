//
//  ViewController.swift
//  BasicCombine
//
//  Created by UW-IN-LPT0108 on 2/26/22.
//

import UIKit
import Combine

class StringSubscriber: Subscriber {
    func receive(subscription: Subscription) {
        print("Received Subscription")
        subscription.request(.max(3)) //backpressure
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
        print("Received value", input)
        return .none
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        print("Complted")
    }
    
    typealias Input = String
    typealias Failure = Never
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let publisher = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K"].publisher
        let subscriber = StringSubscriber()
        publisher.subscribe(subscriber)
    }
}

