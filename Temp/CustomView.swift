//
//  CustomView.swift
//  Temp
//
//  Created by Jaimin Modi on 19/02/20.
//  Copyright © 2020 Jaimin Modi. All rights reserved.
//

import UIKit

class CustomView: UIView {

    
    static let xibName = "CustomView"
    
    @IBOutlet weak var viewTopAnchor: NSLayoutConstraint?
    @IBOutlet weak var btn: UIButton?
    var completion: (() -> Void)?

    var parentView : UIViewController!

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    public static func getInstance(_ vc : UIViewController, _ completion : (() -> Void)? ) -> UIView {

        let view = Bundle.main.loadNibNamed(CustomView.xibName, owner: self, options: nil)?.first as! CustomView
        view.parentView = vc
        view.completion = completion
       // view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 120)
        view.initUI()

        return view
    }

    
    func initUI() {

      //  let tapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(CustomView.dismiss))
       // mainView.addGestureRecognizer(tapGestureRecognizer)

        //btn?.addTarget(self, action: #selector(CustomView.dismiss), for: .touchUpInside)


        parentView.view.addSubview(self)

        self.translatesAutoresizingMaskIntoConstraints = false

       // self.leadingAnchor.constraint(equalTo: parentView.view.leadingAnchor, constant: 0).isActive = true
      //  self.trailingAnchor.constraint(equalTo: parentView.view.trailingAnchor, constant: 0).isActive = true
     //   viewTopAnchor?.constant = -150
        
     //   viewTopAnchor?.constant = 300
      //  viewTopAnchor?.isActive = true

        
        
        let guide = self.parentView.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate(
            [self.leftAnchor.constraint(equalTo: self.parentView.view.leftAnchor),
             self.heightAnchor.constraint(equalToConstant: 50),
             self.rightAnchor.constraint(equalTo: self.parentView.view.rightAnchor),
             // segmentedControl!.topAnchor.constraint(equalTo: view.topAnchor, constant: 80)]
                self.topAnchor.constraint(equalTo: guide.topAnchor, constant: 0)]
            
            
        )

        setNeedsDisplay()
        layoutIfNeeded()

       /* DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 ) {
            self.mainView.isHidden = false
            self.showAnimation()
        }*/

    }

    @IBAction func dismissButtonClick(_ sender: Any) {
        print("dismissButtonClick") // not called
       // self.completion?()
       // self.removeFromSuperview()
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
