//
//  PopularPostCollectionViewCell.swift
//  Basem Emara
//
//  Created by Basem Emara on 2018-06-24.
//  Copyright © 2018 Zamzam Inc. All rights reserved.
//

import UIKit
import SwiftyPress
import ZamzamCore

class PopularPostCollectionViewCell: UICollectionViewCell, PostsDataViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var summaryLabel: UILabel!
    @IBOutlet private weak var featuredImage: UIImageView!
    @IBOutlet private weak var favoriteButton: UIButton!
    
    private var model: PostsDataViewModel?
    private weak var delegate: PostsDataViewDelegate?
}

extension PopularPostCollectionViewCell {
    
    func load(_ model: PostsDataViewModel) {
        self.model = model
        
        titleLabel.text = model.title
        summaryLabel.text = model.summary
        featuredImage.setImage(from: model.imageURL)
        favoriteButton.isSelected =  model.favorite ?? false
    }
    
    func load(_ model: PostsDataViewModel, delegate: PostsDataViewDelegate?) {
        self.delegate = delegate
        load(model)
    }
}

private extension PopularPostCollectionViewCell {
    
    @IBAction func favoriteButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        guard let model = model else { return }
        delegate?.postsDataView(toggleFavorite: model)
    }
}
