//
//  ImageGridDelegate.swift
//  miniBootcampChallenge
//
//  Created by Dante Perez on 05/04/23.
//

import UIKit

//Protocol to notify when the images have finished loading
protocol ImageGridDelegate{
    func finishedLoadingImages()
}

class ImageLoader{
    
    private (set) lazy var urls: [URL] = URLProvider.urls
    private (set) var photos: [UIImage] = []
    
    //Delegate to notify when the images have finished loading
    var delegate: ImageGridDelegate?
    
    func fetchImages(){
        //Fetch images asynchronously
        DispatchQueue.global().async{
            var _photos: [UIImage] = []
            
            //Loop through the URLs and fetch the images
            for (index,url) in self.urls.enumerated(){
                let data = try? Data(contentsOf: url)
                if let image = UIImage(data: data!){
                    _photos.append(image)
                }
                
                //Once all the images have been fetched, assigned them to the photos array
                if index == self.urls.count - 1{
                    self.photos = _photos
                }
            }
            //Notify the delegate that the images have finished loading
            self.delegate?.finishedLoadingImages()
        }
    }
}
