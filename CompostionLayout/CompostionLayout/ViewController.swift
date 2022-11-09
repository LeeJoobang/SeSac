//
//  ViewController.swift
//  CompostionLayout
//
//  Created by Jooyoung Lee on 2022/11/09.
//

import UIKit

import SnapKit

// MARK: 기본 세팅
class ViewController: UIViewController {

    lazy var collectionView: UICollectionView = {
        let layout = createCompositionLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.id)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.view.addSubview(collectionView)
        baseLayout()
    }
    
    func baseLayout(){
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { // item 갯수를 조정한다.
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.id, for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
    
    
}

// MARK: composion layout
extension ViewController {
    // MARK: 한 section에 작용
    func layout() -> UICollectionViewLayout {
        // MARK: item
        // 1. item size 비율을 적용해줌. 아이템 사이즈는 그룹을 기준으로 비율로 적용하였음.
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize) // item 에 itemsize를 적용하였음.
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 30)
        // MARK: gruoup
        // 1. group size 비율을 적용해줌. 아이템 사이즈는 device별 사이즈 기준으로 비율로 적용하였음.
        let gruopSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: gruopSize, subitems: [item])
//        let group2 = NSCollectionLayoutGroup.horizontal(layoutSize: gruopSize, subitem: item, count: 10)
        // MARK: section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
        section.orthogonalScrollingBehavior = .groupPagingCentered // sesac study onbording view와 같이 표현이 가능함.
        // MARK: return
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}


extension ViewController {
    func createCompositionLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout{ (sectionNumber, env) -> NSCollectionLayoutSection? in
            if sectionNumber == 0 {
                return self.firstLayout()
            } else {
                return self.secondLayout()
            }
        }
        
    }
    
    // MARK: 여러 section에 작용
    func firstLayout() -> NSCollectionLayoutSection {
        // MARK: item
        // 1. item size 비율을 적용해줌. 아이템 사이즈는 그룹을 기준으로 비율로 적용하였음.
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize) // item 에 itemsize를 적용하였음.
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 30)
        // MARK: gruoup
        // 1. group size 비율을 적용해줌. 아이템 사이즈는 device별 사이즈 기준으로 비율로 적용하였음.
        let gruopSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: gruopSize, subitems: [item])
//        let group2 = NSCollectionLayoutGroup.horizontal(layoutSize: gruopSize, subitem: item, count: 10)
        // MARK: section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
        section.orthogonalScrollingBehavior = .groupPagingCentered // sesac study onbording view와 같이 표현이 가능함.
        // MARK: return
        return section
    }
    
    func secondLayout() -> NSCollectionLayoutSection {
        // MARK: item
        // 1. item size 비율을 적용해줌. 아이템 사이즈는 그룹을 기준으로 비율로 적용하였음.
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.3))
        let item = NSCollectionLayoutItem(layoutSize: itemSize) // item 에 itemsize를 적용하였음.
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 30)
        // MARK: gruoup
        // 1. group size 비율을 적용해줌. 아이템 사이즈는 device별 사이즈 기준으로 비율로 적용하였음.
        let gruopSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(0.5))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: gruopSize, subitems: [item])
//        let group2 = NSCollectionLayoutGroup.horizontal(layoutSize: gruopSize, subitem: item, count: 10)
        // MARK: section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
        section.orthogonalScrollingBehavior = .groupPagingCentered // sesac study onbording view와 같이 표현이 가능함.
        // MARK: return
        return section
    }
}
