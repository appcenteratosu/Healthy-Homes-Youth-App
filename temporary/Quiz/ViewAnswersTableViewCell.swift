//
//  ViewAnswersTableViewCell.swift
//  temporary
//
//  Created by osuappcenter on 8/8/18.
//  Copyright © 2018 Tejasree V App Developement. All rights reserved.
//

import UIKit

class ViewAnswersTableViewCell: UITableViewCell {

    @IBOutlet weak var AnswersLabel : UILabel!
    @IBOutlet weak var AnswerImage : UIImageView!
    @IBOutlet weak var StatusLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
