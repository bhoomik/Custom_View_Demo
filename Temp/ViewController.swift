//
//  ViewController.swift
//  Temp
//

import UIKit


extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}

class ViewController: UIViewController {

    
    @IBOutlet weak var viewNav :  CustomView!
    
    var completion: (() -> Void)?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        /*viewNav  = UIView.fromNib()
        viewNav.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: viewNav.frame.size.height)
        
        self.view.addSubview(viewNav)*/

        
        CustomView.getInstance(self, completion)


        // Do any additional setup after loading the view.
    }
    
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
