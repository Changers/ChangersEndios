import EOFoundation
import ChangersSDK
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
