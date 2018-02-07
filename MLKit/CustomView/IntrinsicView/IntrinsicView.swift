//
//  IntrinsicView.swift
//  MLAVKit
//
//  Created by Anh Vu on 1/31/18.
//

public class IntrinsicView: UIView {
    
    
    @IBInspectable
    public var witdh: CGFloat = 1 {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    @IBInspectable
    public var height: CGFloat = 0 {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override public var intrinsicContentSize: CGSize {
        return CGSize(width: witdh, height: height)
    }
    
}
