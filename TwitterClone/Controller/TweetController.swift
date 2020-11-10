//
//  TweetController.swift
//  TwitterClone
//
//  Created by Andrii Boichuk on 28/10/2020.
//

import UIKit

private let cellReuseIdentifier = "TweetCell"
private let headerIdentifier = "TweetHeader"

class TweetController: UICollectionViewController {
    
    // MARK: - Properties
    
    let tweet: Tweet
    private var replies = [Tweet]() {
        didSet { collectionView.reloadData() }
    }
    
    // MARK: - Lifecycle
    
    init(tweet: Tweet) {
        self.tweet = tweet
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        fetchReplies()
    }
    
    // MARK: - Helpers
    
    func configureCollectionView() {
        navigationController?.navigationBar.tintColor = .twitterBlue
        collectionView.backgroundColor = .white
        collectionView.register(TweetCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        collectionView.register(TweetHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: headerIdentifier)

    }
    
    // MARK: - API
    
    func fetchReplies() {
        TweetService.shared.fetchReplies(forTweet: tweet) { replies in
            self.replies = replies
        }
    }
}

// MARK: - UICollectionViewDataSource

extension TweetController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return replies.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! TweetCell
        cell.tweet = replies[indexPath.row]
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension TweetController {
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! TweetHeader
        header.tweet = tweet
        
        return header
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension TweetController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let viewModel = TweetViewModel(tweet: tweet)
        let captionHeight = viewModel.size(forWidth: view.frame.width).height
        return CGSize(width: view.frame.width, height: captionHeight + 260)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 120)
    }
}
