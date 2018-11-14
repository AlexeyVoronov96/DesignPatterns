//Builder

import UIKit

protocol ThemeProtocol {
    
    var backgroundColor: UIColor { get }
    var textColor: UIColor { get }
    
}

class Theme: ThemeProtocol {
    
    var backgroundColor: UIColor
    var textColor: UIColor
    
    init(backgroundColor: UIColor, textColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.textColor = textColor
    }
    
}

protocol ThemeBuilderProtocol {
    
    func setBackground(color: UIColor)
    
    func setText(color: UIColor)
    
    func createTheme() -> ThemeProtocol?
    
}

class ThemeBuilder: ThemeBuilderProtocol {
    
    private var _backgroundColor: UIColor?
    private var _textColor: UIColor?
    
    func setBackground(color: UIColor) {
        self._backgroundColor = color
    }
    
    func setText(color: UIColor) {
        self._textColor = color
    }
    
    func createTheme() -> ThemeProtocol? {
        guard let backgroundColor = _backgroundColor, let textColor = _textColor else { return nil }
        return Theme(backgroundColor: backgroundColor, textColor: textColor)
    }
    
}

let builder = ThemeBuilder()
builder.setBackground(color: .black)
builder.setText(color: .white)
let theme = builder.createTheme()
print(theme)
