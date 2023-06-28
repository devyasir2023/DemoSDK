import UIKit

public struct DemoSDK {
    public static let shared: DemoSDK = .init()

    public init() { }
    
    public func launchScreen(from: UIViewController) -> Void {
        let coverViewController = SampleViewController()
        coverViewController.modalPresentationStyle = .fullScreen
        coverViewController.modalTransitionStyle = .crossDissolve
        from.present(coverViewController, animated: true, completion: nil)
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
