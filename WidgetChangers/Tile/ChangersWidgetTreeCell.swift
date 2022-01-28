//
//  ChangersWidgetTreeCell.swift
//  WidgetChangers
//
//  Created by Clement Yerochewski on 25.01.22.
//

import UIKit
import EOFoundation
import ChangersSDK

class ChangersWidgetTreeCell: WidgetCollectionCellType, ChangersStatisticDelegate {

    public static var implementationType: CellImplementationType = .xib
    @IBOutlet weak var treePlantedLabel: UILabel!
    
    lazy var changersEndiosAdapter = ChangersEndiosAdapter()

    public func setup(with widget: WidgetModel) {
        super.setup(widget: widget)
    }
    
    public func willBeDisplayed() {
        changersEndiosAdapter.fetchStatistic(delegate: self)
    }

    
    public func statisticDidFail(with error: ChangersAuthenticateError?) {
        print("statisticDidFail with error :", error)
    }
    
    public func statisticDidSuccess(with statistic: ChangersStatistic) {
        var treePlantedString: String = "0"
        if let treePlanted = statistic.charity?.userTreesPlanted {
            treePlantedString = Double(treePlanted).toString()
        }
        self.treePlantedLabel.text = "Deine Bäume: \(treePlantedString)"
    }

}
