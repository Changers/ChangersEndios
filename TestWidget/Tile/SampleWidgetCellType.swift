import EOFoundation

///
/// Please note that the structure of WidgetCollectionCellType has changed
///

public class SampleWidgetCellType: WidgetCollectionCellType {
    
    /// This will tell us how to instantiate your controller when we want to open a widget
    public static var implementationType: CellImplementationType = .programmatically
    
///   This was moved up to base class
///   `public var widget: WidgetModel?`
    
///   This was changed from a variable
///   `public var isLoginRequired = false`
///   To get-only variable with `false` value by default
///
/// ```
///   public override var isLoginRequired: Bool {
///       false
///   }
/// ```
///
    /// This function used to set widget, now it has to call super function which does it instead
/// ```
///    public func setup(with widget: WidgetModel) {
///        self.widget = widget
///    }
/// ```

    public func setup(with widget: WidgetModel) {
        super.setup(widget: widget)
    }
    
///    This should no longer have an empty implementation if you are not going to use
///    deeplinking functionality
///    `public func didCallFromLink(dict: [String : Any]?) { }`
///
}
