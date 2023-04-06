//
//  Spinner.swift
//  miniBootcampChallenge
//
//  Created by Dante Perez on 29/03/23.
//

import UIKit

extension UIImageView{
    
    //Function to add and start the activity indicator view aka the spinner
    func spin(style: UIActivityIndicatorView.Style = .medium){
        let spinner = UIActivityIndicatorView(style: style)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        spinner.color = .brown
        
        //Adding to the view hierarchy
        addSubview(spinner)
        //Position the spinner in the center of the view
        spinner.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        spinner.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        //Start animating the spinner
        spinner.startAnimating()

    }
    
    //Function to stop and remove the spinner from view
    func stopSpin(){
        /*Loop through all the subviews and once the activity indicator is found,
        stop the animation and remove the spinner from the view hierarchy*/
        for subview in subviews{
            if let spinner = subview as? UIActivityIndicatorView{
                spinner.stopAnimating()
                spinner.removeFromSuperview()
            }
        }
    }
    
}
