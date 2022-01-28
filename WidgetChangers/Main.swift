import EOFoundation
import ChangersSDK

struct ChangersWidgetPresentationProvider: WidgetPresentationProvider {
    func viewController(using widget: WidgetModel) -> UIViewController? {
        return Changers.webApp()
    }
    
    var navigationType: ControllerNavigationType { .push }
}

public func changersWidget() -> WidgetContainer {
    (type: "sample_widget_key",
     WidgetType(collectionViewCellType: ChangersWidgetCellType.self,
                presentationProvider: ChangersWidgetPresentationProvider()))
}

public func changersMarketplaceWidget() -> WidgetContainer {
    (type: "sample_widget_key_2",
     WidgetType(collectionViewCellType: ChangersWidgetMarketplaceCellType.self,
                presentationProvider: ChangersWidgetPresentationProvider()))
}

public func changersTreeWidget() -> WidgetContainer {
    (type: "sample_widget_key_tree",
     WidgetType(collectionViewCellType: ChangersWidgetTreeCell.self,
                presentationProvider: ChangersWidgetPresentationProvider()))
}

public func changersStatisticWidget() -> WidgetContainer {
    (type: "sample_widget_key_statistic",
     WidgetType(collectionViewCellType: ChangersWidgetStatisticCollectionViewCell.self,
                presentationProvider: ChangersWidgetPresentationProvider()))
}

public func changersClimateCoinWidget() -> WidgetContainer {
    (type: "sample_widget_key_climate_coin",
     WidgetType(collectionViewCellType: ChangersWidgetClimateCoinCollectionViewCell.self,
                presentationProvider: ChangersWidgetPresentationProvider()))
}
