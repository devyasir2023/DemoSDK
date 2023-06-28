import UIKit

public struct DemoSDK {
    public static let shared: DemoSDK = .init()

    public init() { }
    
    public func launchScreen() -> Void {
        guard let topController = UIViewController.topViewController() else {
            return
        }
        
        let coverViewController = SampleViewController()
        coverViewController.modalPresentationStyle = .fullScreen
        coverViewController.modalTransitionStyle = .crossDissolve
        topController.present(coverViewController, animated: true, completion: nil)
    }
}

class SampleViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel(frame: CGRect(x: 50, y: 50, width: 200, height: 100))
        label.text = "Hello, World!"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        
        view.addSubview(label)
    }
}

class YourViewController: UIViewController {
    override func viewDidLoad() {
        
    }
}

extension UIViewController {
    static func topViewController() -> UIViewController? {
        
        if var presentedVC = UIApplication.shared.keyWindow?.rootViewController{
            // only for flotingbuttons
            if(presentedVC.isKind(of: YourViewController.self)){
                let keyWindow = UIApplication.shared.windows[0]
                if var topController = keyWindow.rootViewController {
                    while let presentedViewController = topController.presentedViewController {
                        topController = presentedViewController
                    }
                    return topController
                }
            }else{
                while let pVC = presentedVC.presentedViewController {
                    presentedVC = pVC
                }
                return presentedVC
            }
        }
        return UIViewController()
    }
}
