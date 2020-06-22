//
//  MainViewController.swift
//  Wheather
//
//  Created by Алихан on 18/06/2020.
//  Copyright © 2020 Nexen Origin, LLC. All rights reserved.
//

import UIKit
import Lottie

class MainViewController: UIViewController {

    //MARK: - Properties
    private var output: MainScreenViewOutput?
    private var isHeaderExpanded = false
    
    //MARK: - Constants
    private let headerCollapsedHeight: CGFloat = 180
    
    //MARK: - Outlets
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var firstTabHeaderView: UIView!
    @IBOutlet weak var secondTabHeaderView: UIView!
    @IBOutlet weak var headerPullView: UIView!
    @IBOutlet weak var citiesSegmentedControl: UISegmentedControl!
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var firstTabListView: UIView!
    @IBOutlet weak var secondTabListView: UIView!
    @IBOutlet weak var headerViewHeightConstraint: NSLayoutConstraint!
    
    
    
    //MARK: - Incapsulation
    
    func set(output: MainScreenViewOutput) {
        self.output = output
    }
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.output?.didTriggerViewReadyEvent()
    }
    
    
    //MARK: - Actions
    
    @IBAction func mapButtonAction(_ sender: Any) {
        self.output?.didPressedMapButton()
    }
    
    @IBAction func didChangeTab(_ sender: Any) {
        self.showTabAt(index: self.citiesSegmentedControl.selectedSegmentIndex)
    }
    
    //MARK: - Private
    
    private func setupInitialState() {
        let contentViews = [self.firstTabHeaderView, self.secondTabHeaderView, self.firstTabListView, self.secondTabListView]
        
        for contentView in contentViews {
            let path = Bundle.main.path(forResource: "loader", ofType: "json") ?? String.empty
            let animation = AnimationView(filePath: path)
            animation.frame = CGRect(x: (contentView?.center.x ?? 0) - 50, y: ((contentView?.bounds.size.height ?? 0) / 2) - 50, width: 100, height: 100)
            contentView?.addSubview(animation)
            animation.loopMode = .loop
            animation.play()
        }
    }
    
    private func clear(view: UIView) {
        for subview in view.subviews {
           subview.removeFromSuperview()
        }
    }
    
    private func showTabAt(index: Int) {
        
        self.firstTabHeaderView.isHidden = index == 1
        self.secondTabHeaderView.isHidden = index == 0
        self.firstTabListView.isHidden = index == 1
        self.secondTabListView.isHidden = index == 0

    }
    
    private func updateHeader() {
        self.view.bringSubviewToFront(self.headerView)
        let height = !self.isHeaderExpanded ? self.headerCollapsedHeight + 330 : self.headerCollapsedHeight
        
        UIView.animate(withDuration: 0.3) {
            self.headerViewHeightConstraint.constant = height
            self.view.layoutSubviews()
            self.headerView.layoutSubviews()
        }
        
    }
    
    private func load(childViewController: UIViewController, to containerView: UIView) {
        self.clear(view: containerView)
        self.addChild(childViewController)
        containerView.addSubview(childViewController.view)
        childViewController.didMove(toParent: self)
    }
    
    private func configureGestures() {
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGesture(gesture:)))
        swipeUp.direction = .up
        self.headerPullView.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGesture(gesture:)))
        swipeDown.direction = .down
        self.headerPullView.addGestureRecognizer(swipeDown)
        
        self.headerView.clipsToBounds = true
    }
    
    //MARK: - Objc
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == .up {
            if self.isHeaderExpanded {
                self.updateHeader()
                self.isHeaderExpanded.toggle()
            }
        } else if gesture.direction == .down {
            if !self.isHeaderExpanded {
                self.updateHeader()
                self.isHeaderExpanded.toggle()
            }
        }
    }
    
}


//MARK: - ViewInput

extension MainViewController: MainScreenViewInput {
    func configureFirstTabWith(headerView: UIViewController, listView: UIViewController) {
        self.load(childViewController: headerView, to: self.firstTabHeaderView)
        self.load(childViewController: listView, to: self.firstTabListView)
    }
    
    func configureSecondTabWith(headerView: UIViewController, listView: UIViewController) {
        self.load(childViewController: headerView, to: self.secondTabHeaderView)
        self.load(childViewController: listView, to: self.secondTabListView)
    }
    
    func configureView() {
        self.setupInitialState()
        self.configureGestures()
    }
    
}

