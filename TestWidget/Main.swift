import EOFoundation

struct SampleWidgetPresentationProvider: WidgetPresentationProvider {
    func viewController(using widget: WidgetModel) -> UIViewController? {
        let controller = SampleWidgetViewControllerType()
        controller.setup(with: widget)
        return controller
    }
    
    var navigationType: ControllerNavigationType { .push }
}

public func widget() -> WidgetContainer {
    (type: "sample_widget_key",
     WidgetType(collectionViewCellType: SampleWidgetCellType.self,
                presentationProvider: SampleWidgetPresentationProvider()))
}
