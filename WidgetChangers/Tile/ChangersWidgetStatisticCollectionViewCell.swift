//
//  ChangersWidgetStatisticCollectionViewCell.swift
//  WidgetChangers
//
//  Created by Clement Yerochewski on 26.01.22.
//

import UIKit
import ChangersSDK
import EOFoundation

class ChangersWidgetStatisticCollectionViewCell: WidgetCollectionCellType, ChangersStatisticDelegate {

    public static var implementationType: CellImplementationType = .xib
    @IBOutlet weak var walkingLabel: UILabel!
    @IBOutlet weak var bikingLabel: UILabel!
    @IBOutlet weak var publicTransportLabel: UILabel!
    @IBOutlet weak var footprintLabel: UILabel!

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
        let currentYearString = Date().currentYearString
        let currentYearCO2 = statistic.organisation.co2Avoided.convertWeightToBigNumbers().balanceString(unit: true)

        self.footprintLabel.text = "Einsparung \(currentYearString): \(currentYearCO2) CO2"
        self.walkingLabel.text = statistic.organisation.walkingDistance.convertDistanceToBigNumbers().distanceString(unit: true)
        self.bikingLabel.text = statistic.organisation.cyclingDistance.convertDistanceToBigNumbers().distanceString(unit: true)
        self.publicTransportLabel.text = 0.convertDistanceToBigNumbers().distanceString(unit: true)
//        statistic.organisation.walkingDistance.distanceString(unit: true)
    }

}
