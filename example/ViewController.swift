//
//  ViewController.swift
//  example
//
//  Created by 冯奕琦 on 2019/2/9.
//  Copyright © 2019 冯奕琦. All rights reserved.
//

import UIKit
import Gallery
import Photos

class ViewController: UIViewController,GalleryControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    
    func galleryController(_ controller: GalleryController, didSelectImages images: [Image]) {
        imageView.image = getAssetThumbnail(asset:images.first!.asset)
        controller.dismiss(animated: true, completion: nil)
        return
    }
    
    func galleryController(_ controller: GalleryController, didSelectVideo video: Video) {
        return
    }
    
    func galleryController(_ controller: GalleryController, requestLightbox images: [Image]) {
        return
    }
    
    func galleryControllerDidCancel(_ controller: GalleryController) {
        controller.dismiss(animated: true, completion: nil)
        return
    }
    
    
    var gallery = GalleryController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gallery.delegate = self
        Gallery.Config.tabsToShow = [.imageTab]
        Gallery.Config.Grid.FrameView.borderColor = #colorLiteral(red: 0.02745098039, green: 0.462745098, blue: 0.4705882353, alpha: 1)
        Gallery.Config.Grid.CloseButton.tintColor = #colorLiteral(red: 0.02745098039, green: 0.462745098, blue: 0.4705882353, alpha: 1)
        Gallery.Config.PageIndicator.textColor = #colorLiteral(red: 0.02745098039, green: 0.462745098, blue: 0.4705882353, alpha: 1)
    }

    @IBAction func button(_ sender: Any) {

        
        
        present(gallery, animated: true, completion: nil)
    }
    
    func getAssetThumbnail(asset: PHAsset) -> UIImage {
        let manager = PHImageManager.default()
        let option = PHImageRequestOptions()
        var thumbnail = UIImage()
        option.isSynchronous = true
        manager.requestImage(for: asset, targetSize: CGSize(width: asset.pixelWidth, height: asset.pixelHeight), contentMode: .aspectFit, options: option, resultHandler: {(result, info)->Void in
            thumbnail = result!
        })
        return thumbnail
    }
    
}

