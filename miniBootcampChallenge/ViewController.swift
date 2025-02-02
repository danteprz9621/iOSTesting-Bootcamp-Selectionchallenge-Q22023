//
//  ViewController.swift
//  miniBootcampChallenge
//

import UIKit

class ViewController: UICollectionViewController, ImageGridDelegate {
    
    private struct Constants {
        static let title = "Mini Bootcamp Challenge"
        static let cellID = "imageCell"
        static let cellSpacing: CGFloat = 1
        static let columns: CGFloat = 3
        static var cellSize: CGFloat?
    }
    
    private lazy var urls: [URL] = URLProvider.urls
    private var ImageGrid = ImageLoader()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.title
        
        //Setting the delegate of ImageGrid to self and then fetching images
        /*Comment following two lines to disable function 1*/
        ImageGrid.delegate = self
        ImageGrid.fetchImages()
    }
    
    /*Comment finishedLoadingImages function when disabling function 1*/
    //Function that is called once the images have finished loading
    func finishedLoadingImages() {
        DispatchQueue.main.async {
            //Reload collection view with fetched images
            self.collectionView.reloadData()
        }
    }
}


// TODO: 1.- Implement a function that allows the app downloading the images without freezing the UI or causing it to work unexpected way

// TODO: 2.- Implement a function that allows to fill the collection view only when all photos have been downloaded, adding an animation for waiting the completion of the task.


// MARK: - UICollectionView DataSource, Delegate
extension ViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        urls.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellID, for: indexPath) as? ImageCell else { return UICollectionViewCell() }
        
        /*Uncomment following four lines when disabling function 2*/
        //let url = urls[indexPath.row]
        //let data = try? Data(contentsOf: url)
        //let image = UIImage(data: data!)
        //cell.display(image)
        
        /*Comment following four lines to disable function 2*/
        //Display the fetched image in the cell if it exists, else displaye the spinner
        if !ImageGrid.photos.isEmpty{
            cell.display(ImageGrid.photos[indexPath.row])
        } else {
            cell.display()
        }

        return cell
    }
}


// MARK: - UICollectionView FlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if Constants.cellSize == nil {
          let layout = collectionViewLayout as! UICollectionViewFlowLayout
            let emptySpace = layout.sectionInset.left + layout.sectionInset.right + (Constants.columns * Constants.cellSpacing - 1)
            Constants.cellSize = (view.frame.size.width - emptySpace) / Constants.columns
        }
        return CGSize(width: Constants.cellSize!, height: Constants.cellSize!)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        Constants.cellSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        Constants.cellSpacing
    }
}
