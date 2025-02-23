//
//  TRTCCreateChatSalonViewController.swift
//  TRTCChatSalonDemo
//
//  Created by abyyxwang on 2020/6/4.
//  Copyright © 2020 tencent. All rights reserved.
//

import UIKit

class TRTCCreateChatSalonViewController: UIViewController {
    // 依赖管理者
    let dependencyContainer: TRTCChatSalonEnteryControl
    
    init(dependencyContainer: TRTCChatSalonEnteryControl) {
        self.dependencyContainer = dependencyContainer
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        TRTCLog.out("deinit \(type(of: self))")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = TRTCCreateChatSalonRootView.viewTitle
        let backItem = UIBarButtonItem.init(image: UIImage.init(named: "navigationbar_back"), style: .plain, target: self, action: #selector(cancel))
        self.navigationItem.leftBarButtonItem = backItem
    }
    
    override func loadView() {
        let chatSalonModel = dependencyContainer.makeCreateChatSalonViewModel()
        let rootView = TRTCCreateChatSalonRootView.init(viewModel: chatSalonModel)
        chatSalonModel.viewResponder = rootView
        rootView.rootViewController = self
        view = rootView
    }
    
    /// 取消
    @objc func cancel() {
        navigationController?.popViewController(animated: true)
    }
}
