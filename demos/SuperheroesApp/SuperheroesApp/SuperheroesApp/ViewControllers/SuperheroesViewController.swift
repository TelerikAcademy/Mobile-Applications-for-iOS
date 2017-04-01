//
//  SuperheroesViewController.swift
//  SuperheroesApp
//
//  Created by Doncho Minkov on 3/31/17.
//  Copyright © 2017 Doncho Minkov. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Superhero cell"

class SuperheroesViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, SuperheroesDataDelegate {
    var superheroes: [Superhero] = []
    var data: SuperheroesData?
    
    var loadingView: SuperheroesLoadingView?
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingView = SuperheroesLoadingView(frame: view.frame)
        view.addSubview(loadingView!)
        loadingView?.startLoading()
        
        data = SuperheroesData()
        data?.delegate = self
        data?.getAll()
        
        self.collectionView!.register(UINib(nibName: "SuperheroCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 3.2
        let height =
            (collectionView.frame.width > collectionView.frame.height)
                ? collectionView.frame.height
                : collectionView.frame.height / 3;
        
        return CGSize(width: width, height: height)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return superheroes.count
    }
    
    var loadingCounter = 0
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SuperheroCollectionViewCell
        
        cell.textLabel.text = superheroes[indexPath.row].name
        
        let http = HttpRequester()
        
        weak var weakCell = cell
        
        loadingCounter += 1
        checkShowLoading()
        
        cell.imageView.image = #imageLiteral(resourceName: "default-superhero")
        http.getData(fromUrl: superheroes[indexPath.row].imgUrl) { (imageData) in
            let image = UIImage(data: imageData)
            self.loadingCounter -= 1
            self.checkHideLoading()
            DispatchQueue.main.async {
                weakCell?.imageView.image = image
            }
        }
        
        return cell
    }
    
    func checkShowLoading() {
        if (loadingView?.isLoading)! {
            return
        }
        loadingView?.startLoading()
    }
    
    func checkHideLoading() {
        if loadingCounter > 0 {
            return
        }
        if !(loadingView?.isLoading)! {
            return
        }
        
        loadingView?.stopLoading()
        
    }
    
    func didReceivedAll(superheroes: [Superhero]) {
        self.superheroes = superheroes
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(5)) {
            self.collectionView?.reloadData()
            self.loadingView?.stopLoading()
        }
    }
}
