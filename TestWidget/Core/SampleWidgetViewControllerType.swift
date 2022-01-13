import EOFoundation

final class SampleWidgetViewControllerType: UIViewController {
    var widget: WidgetModel?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(class: SampleWidgetTableCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.add(subview: tableView).fill(inside: view)
        
        view.addGradientBackground()
        
        title = widget?.title
    }
    
    func setup(with widget: WidgetModel) {
        self.widget = widget
    }
}

extension SampleWidgetViewControllerType: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        SampleWidgetCellModel.models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        SampleWidgetCellModel.models[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cell: SampleWidgetTableCell.self, for: indexPath)
        let model = SampleWidgetCellModel.models[indexPath.section][indexPath.row]
        cell.configure(with: model)
        return cell
    }
}

extension SampleWidgetViewControllerType: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

final class SampleWidgetTableCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: SampleWidgetCellModel) {
        textLabel?.text = model.title
        textLabel?.textColor = model.color
        textLabel?.setStyle(model.textStyle)
        contentView.backgroundColor = model.backgroundColor
    }
}

struct SampleWidgetCellModel {
    static let models: [[SampleWidgetCellModel]] = {
        let section0 = [
            SampleWidgetCellModel(title: "Primary color", backgroundColor: Theme.primaryColor),
            SampleWidgetCellModel(title: "Secondary color", backgroundColor: Theme.secondaryColor),
            SampleWidgetCellModel(title: "Tertiary color", backgroundColor: Theme.tertiaryColor)
        ]
        
        let section1 = [
            SampleWidgetCellModel(title: "Headline 1", textStyle: .headline1, backgroundColor: .lightGray),
            SampleWidgetCellModel(title: "Headline 2", textStyle: .headline2, backgroundColor: .lightGray),
            SampleWidgetCellModel(title: "Headline 3", textStyle: .headline3, backgroundColor: .lightGray),
            SampleWidgetCellModel(title: "Headline 4", textStyle: .headline4, backgroundColor: .lightGray),
            SampleWidgetCellModel(title: "Subline 1", textStyle: .subline1, backgroundColor: .lightGray),
            SampleWidgetCellModel(title: "Subline 2", textStyle: .subline2, backgroundColor: .lightGray),
            SampleWidgetCellModel(title: "Body", textStyle: .body, backgroundColor: .lightGray),
            SampleWidgetCellModel(title: "Note", textStyle: .note, backgroundColor: .lightGray),
            SampleWidgetCellModel(title: "Link", textStyle: .link, backgroundColor: .lightGray)
        ]
        
        let section2 = Theme.backgroundColors.enumerated().map {
            SampleWidgetCellModel(title: "Background color \($0.offset)", color: .white, backgroundColor: $0.element)
        }
        
        return [
            section0,
            section1,
            section2
        ]
    }()
    
    let title: String
    let color: UIColor?
    let textStyle: TextStyleType?
    let backgroundColor: UIColor?
    
    init(title: String,
         color: UIColor? = nil,
         textStyle: TextStyleType? = nil,
         backgroundColor: UIColor? = nil) {
        self.title = title
        self.color = color
        self.textStyle = textStyle
        self.backgroundColor = backgroundColor
    }
}
