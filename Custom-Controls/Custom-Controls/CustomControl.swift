//
//  CustomControl.swift
//  Custom-Controls
//
//  Created by Hector Steven on 5/14/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
	var value = 1
	private let componentDimension: CGFloat = 40.0
	private let componentCount = 5
	private let componentActiveColor = UIColor.black
	private let componentInactiveColor = UIColor.gray
	
	required init?(coder aCoder: NSCoder) {
		super.init(coder: aCoder)
		setup()
	}
	
	
	private func setup() {
		var labels: [UILabel] = []
		
		for i in 0...4 {
			let label = UILabel()
			let frame =  CGRect(x: 8.0 + componentDimension * CGFloat(i), y: 0, width: componentDimension, height: componentDimension)
			label.frame = frame
			label.tag = i + 1
			label.font = UIFont.boldSystemFont(ofSize: 32)
			//let darkstar = Character(★)
			label.text = "☆"
			labels.append(label)
		}
		labels[0].textColor = .green
		labels.forEach( { addSubview( $0 )} )
		print(labels.count)
	}
	
	override var intrinsicContentSize: CGSize {
		let componentsWidth = CGFloat(componentCount) * componentDimension
		let componentsSpacing = CGFloat(componentCount + 1) * 8.0
		let width = componentsWidth + componentsSpacing
		return CGSize(width: width, height: componentDimension)
	}
	
	override func draw(_ rect: CGRect) {
		
    }
	
	override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
//		let location = touch.location(in: self)
		updateValue(at: touch)
		print(touch.location(in: self))
		return true
	}
	
	override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
		let location = touch.location(in: self)
		
		if bounds.contains(location) {
			sendActions(for: [.touchDragInside,  .touchDragOutside])
		} else {
			updateValue(at: touch)
		}
		
		return true
	}
	
	override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
		guard let touch = touch else { return }
		let location = touch.location(in: self)
		
		if bounds.contains(location) {
			sendActions(for: [.touchUpInside, .touchUpOutside])
		} else {
			updateValue(at: touch)
		}
	}
	
	override func cancelTracking(with event: UIEvent?) {
		sendActions(for: [.touchCancel])
	}
	
	func updateValue(at touch: UITouch) {
		
	}
}
