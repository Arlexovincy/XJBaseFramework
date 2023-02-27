//
//  XJUICollectionViewDelegateLayout.swift
//  XJBaseFramework
//
//  Created by AndreaArlex on 2023/2/24.
//

import UIKit

@objc public protocol XJUICollectionViewDelegateLayout: UICollectionViewDelegate {
    @objc optional func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: XJUICollectionViewLayout, verticalSpacingBetweenSectionAt section: Int, and nextSection: Int) -> CGFloat
    @objc optional func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: XJUICollectionViewLayout, marginForSectionAt section: Int) -> UIEdgeInsets
    @objc optional func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: XJUICollectionViewLayout, paddingForSectionAt section: Int) -> UIEdgeInsets
    
    @objc optional func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: XJUICollectionViewLayout, horizontalSpacingBetweenItemAt indexPath: IndexPath, and nextIndexPath: IndexPath) -> CGFloat
    @objc optional func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: XJUICollectionViewLayout, verticalSpacingBetweenItemAt indexPath: IndexPath, and nextIndexPath: IndexPath) -> CGFloat
    @objc optional func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: XJUICollectionViewLayout, marginForItemAt indexPath: IndexPath) -> UIEdgeInsets
    @objc optional func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: XJUICollectionViewLayout, paddingForItemAt indexPath: IndexPath) -> UIEdgeInsets
    @objc optional func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: XJUICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    @objc optional func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: XJUICollectionViewLayout, zIndexForItemAt indexPath: IndexPath) -> Int
    @objc optional func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: XJUICollectionViewLayout, headerSizeAt section: Int) -> CGSize
    @objc optional func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: XJUICollectionViewLayout, footerSizeAt section: Int) -> CGSize
}
