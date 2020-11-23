//
//  ViewController.swift
//  CombineCocoaPractice
//
//  Created by 原昂大 on 2020/11/22.
//

import UIKit
import Combine
import CombineCocoa

class ViewController: UIViewController {
    
    var subscriptions = Set<AnyCancellable>()
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.tapPublisher
            .sink { [weak self] _ in
                self?.label.text = "button tapped"
            }
            .store(in: &subscriptions)
    }
}
