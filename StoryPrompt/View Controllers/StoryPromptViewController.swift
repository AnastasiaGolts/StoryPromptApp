import UIKit

class StoryPromptViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var storyPromptTextView: UITextView!
    
    var storyPrompt: StoryPromptEntry?
    var isNewStoryPrompt = false
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        storyPromptTextView.text = storyPrompt? .description
        
        if isNewStoryPrompt {
            
            let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveStoryPrompt))
            let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelStoryPrompt))
            navigationItem.rightBarButtonItem = saveButton
            navigationItem.leftBarButtonItem = cancelButton
        }
    }
    

    
    //MARK: - Actions

    @objc func cancelStoryPrompt() {
        
        performSegue(withIdentifier: "CancelStoryPrompt", sender: nil)
    }
    
    @objc func saveStoryPrompt() {
        
        NotificationCenter.default.post(name: .StoryPromptSaved, object: storyPrompt)
        
        performSegue(withIdentifier: "SaveStoryPrompt", sender: nil)
    }
    
}

//MARK: - Extensions

extension Notification.Name {
    
    static let StoryPromptSaved = Notification.Name("StoryPromptSave")
}
