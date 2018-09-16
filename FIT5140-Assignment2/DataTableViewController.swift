//
//  DataTableViewController.swift
//  FIT5140-Assignment2
//
//  Created by 沈宇帆 on 2018/9/16.
//  Copyright © 2018年 Monash University. All rights reserved.
//

import UIKit
import FirebaseDatabase

class DataTableViewController: UITableViewController {
    private var raspios : [Raspio] = []
    private var raspioRef = Database.database().reference().child("raspio")
    private var raspioRefHandle: DatabaseHandle?

    
    private func observeRapios(){
        raspioRefHandle = raspioRef.observe(.childAdded, with: {
            (snapshot) -> Void in
            let data = snapshot.value as! Dictionary<String, AnyObject>
            let id = snapshot.key
            let red = data["red"] as! String?
            let blue = data["blue"] as! String?
            let green = data["green"] as! String?
            let temp = data["temp"] as! String?
            let pressure = data["pressure"] as! String?
            let altimeter = data["altimeter"] as! String?
            if let name = data["name"] as! String?, name.count > 0 {
                self.raspios.append(Raspio(id: id, name: name, red: red!,blue: blue!,green: green!,temp: temp!,pressure: pressure!, altimeter: altimeter!))
                self.tableView.reloadData()
            } else {
                print ("error")
            }
        })
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        observeRapios()
    }
    deinit {
        if let refHandle = raspioRefHandle{
            raspioRef.removeObserver(withHandle: refHandle)
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return raspios.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath) as! DataViewCell
        cell.tempLabel.text = raspios[indexPath.row].temp
        cell.alti.text = raspios[indexPath.row].altimeter
        cell.pressLabel.text = raspios[indexPath.row].pressure
        let rgb = "\(raspios[indexPath.row].red) , \(raspios[indexPath.row].green), \(raspios[indexPath.row].blue)"
        cell.colorLabel.text = rgb
        

        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
