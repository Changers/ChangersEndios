//
//  ChangersWidgetClimateCoinCollectionViewCell.swift
//  WidgetChangers
//
//  Created by Clement Yerochewski on 26.01.22.
//

import UIKit
import ChangersSDK
import EOFoundation

class ChangersWidgetClimateCoinCollectionViewCell: WidgetCollectionCellType, ChangersStatisticDelegate {

    public static var implementationType: CellImplementationType = .xib
    @IBOutlet weak var coinLabel: UILabel!
    @IBOutlet weak var missingLabel: UILabel!

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
        let coinsString = statistic.user.coins.toString()
        let missingCO2 = statistic.user.co2ForNextCoin?.convertWeightToBigNumbers().balanceString(unit: true) ?? "0 kg"
        self.coinLabel.text = "Deine Klima-Taler: \(coinsString)"
        self.missingLabel.text = "Noch \(missingCO2) CO2 bis zum\nnächsten Klima-Taler."
//        statistic.organisation.walkingDistance.distanceString(unit: true)
    }

}
