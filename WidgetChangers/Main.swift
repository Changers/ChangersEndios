import EOFoundation
import ChangersSDK

struct ChangersWidgetPresentationProvider: WidgetPresentationProvider {
    func viewController(using widget: WidgetModel) -> UIViewController? {
        return Changers.webApp()
    }
    
    var navigationType: ControllerNavigationType { .modal }
}

public func changersWidget() -> WidgetContainer {
    (type: "sample_widget_key",
     WidgetType(collectionViewCellType: ChangersWidgetCellType.self,
                presentationProvider: ChangersWidgetPresentationProvider()))
}
