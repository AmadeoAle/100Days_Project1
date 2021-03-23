//
//  ViewController.swift
//  Project1
//
//  Created by Amadeo on 22/03/21.
//

import UIKit

//Agregando un commentario para hacer commit 1
class ViewController: UITableViewController {
    var pictures = [String]()
    var imageString: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for i in items{
            if i.hasPrefix("nssl") || i.hasPrefix("View"){
                pictures.append(i)
            }
        }
        print(pictures)
        
        //Add a title
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
       
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    //Cuando seleccionas una celda de la tabla 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? ResultViewController{
            vc.imageString = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
        /*imageString = tableView.cellForRow(at: indexPath)?.textLabel?.text
        performSegue(withIdentifier: "resultImage", sender: self)*/
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultImage" {
            let destination = segue.destination as! ResultViewController
            destination.imageString = imageString
        }
    }

}

