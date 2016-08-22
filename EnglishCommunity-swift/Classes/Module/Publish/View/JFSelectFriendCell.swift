//
//  JFSelectFriendCell.swift
//  EnglishCommunity-swift
//
//  Created by zhoujianfeng on 16/8/16.
//  Copyright © 2016年 zhoujianfeng. All rights reserved.
//

import UIKit
import SnapKit

class JFSelectFriendCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var relationUser: JFRelationUser? {
        didSet {
            avatarImageView.yy_imageURL = NSURL(string: relationUser!.relationAvatar!)
            nicknameLabel.text = relationUser!.relationNickname!
        }
    }
    
    /**
     准备UI
     */
    private func prepareUI() {
        contentView.addSubview(selectorButton)
        contentView.addSubview(avatarImageView)
        contentView.addSubview(nicknameLabel)
        contentView.addSubview(separatorView)
        
        selectorButton.snp_makeConstraints { (make) in
            make.left.equalTo(15)
            make.centerY.equalTo(contentView)
            make.size.equalTo(CGSize(width: 20, height: 20))
        }
        
        avatarImageView.snp_makeConstraints { (make) in
            make.left.equalTo(selectorButton.snp_right).offset(10)
            make.centerY.equalTo(selectorButton)
            make.size.equalTo(CGSize(width: 40, height: 40))
        }
        
        nicknameLabel.snp_makeConstraints { (make) in
            make.left.equalTo(avatarImageView.snp_right).offset(10)
            make.centerY.equalTo(selectorButton)
        }
        
        separatorView.snp_makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.bottom.equalTo(-0.5)
            make.height.equalTo(0.5)
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        avatarImageView.layer.cornerRadius = 20
        avatarImageView.layer.masksToBounds = true
    }
    
    /**
     修改cell点击后高亮颜色
     */
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        
        if highlighted {
            contentView.backgroundColor = COLOR_ALL_CELL_HIGH
        } else {
            contentView.backgroundColor = COLOR_ALL_BG
        }
    }
    
    // MARK: - 懒加载
    /// 选择图标
    lazy var selectorButton: UIButton = {
        let button = UIButton(type: .Custom)
        button.setBackgroundImage(UIImage(named: "publish_select_normal"), forState: .Normal)
        button.setBackgroundImage(UIImage(named: "publish_select_selected"), forState: .Selected)
        return button
    }()
    
    /// 头像
    lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    /// 昵称
    lazy var nicknameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(16)
        return label
    }()
    
    /// 分割线
    lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = COLOR_ALL_CELL_SEPARATOR
        return view
    }()
    
}