import EOFoundation
import ChangersSDK
import UIKit
///
/// Please note that the structure of WidgetCollectionCellType has changed
///

public class ChangersWidgetCellType: WidgetCollectionCellType, ChangersStatisticDelegate {
    
//    @IBOutlet weak var currentLabel: UILabel!
//    @IBOutlet weak var missingLabel: UILabel!
//    @IBOutlet weak var coinsTotal: UILabel!

    public static var implementationType: CellImplementationType = .programmatically
    
    lazy var changersEndiosAdapter = ChangersEndiosAdapter()

    
    public func setup(with widget: WidgetModel) {
        super.setup(widget: widget)
        let imageView = UIImageView()
        imageView.image = UIImage(named: "test_image")
        imageView.backgroundColor = UIColor.red
        imageView.contentMode = .scaleAspectFit
        add(subview: imageView)
            .height(equalTo: 50)
            .width(equalTo: 50)
            .centerX(equalTo: self, constant: 0)
            .centerY(equalTo: self, constant: 0)
    }
    
    public func willBeDisplayed() {
        changersEndiosAdapter.fetchStatistic(delegate: self)
    }

    
    public func statisticDidFail(with error: ChangersAuthenticateError?) {
//        print("statisticDidFail with error :", error)
    }
    
    public func statisticDidSuccess(with statistic: ChangersStatistic) {
//        print("statisticDidSuccess with statistic :", statistic)
//        print("statisticDidSuccess : \(statistic)")
    }
}
