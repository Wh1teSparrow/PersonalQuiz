//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 07.08.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var aboutResultLabel: UILabel!
    
    var answer: [Answer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        
        getResult(answers: answer, resultLable: resultLabel, aboutResultlable: aboutResultLabel)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}

private func getResult(answers: [Answer], resultLable: UILabel, aboutResultlable: UILabel) {
    var cat = 0
    var dog = 0
    var rabbit = 0
    var turtle = 0
    
    for answer in answers {
        if answer.animal == Animal.cat {
            cat += 1
        } else if answer.animal == Animal.dog {
            dog += 1
        } else if answer.animal == Animal.rabbit {
            rabbit += 1
        } else if answer.animal == Animal.turtle {
            turtle += 1
        }
    }
    
    if cat > rabbit && cat > rabbit && cat > turtle {
        resultLable.text = "Вы - \(String(Animal.cat.rawValue))"
        aboutResultlable.text = Animal.cat.definition
    } else if dog > cat && dog > rabbit && dog > turtle {
        resultLable.text = "Вы - \(String(Animal.dog.rawValue))"
        aboutResultlable.text = Animal.dog.definition
    } else if rabbit > cat && rabbit > dog && rabbit > turtle {
        resultLable.text = "Вы - \(String(Animal.rabbit.rawValue))"
        aboutResultlable.text = Animal.rabbit.definition
    } else if turtle > cat && turtle > dog && turtle > rabbit{
        resultLable.text = "Вы - \(String(Animal.turtle.rawValue))"
        aboutResultlable.text = Animal.turtle.definition
    }
}
