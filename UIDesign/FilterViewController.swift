//
//  FilterViewController.swift
//  UIDesign
//
//  Created by apple on 20/02/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var transactionTypes = ["wallet Payments","Coupon Payments","Card Payments","Referal Payments"]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactionTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "444")
        
        cell.textLabel?.text = transactionTypes[indexPath.row]
        
        if(indexPath.row == 0){
            
            cell.detailTextLabel?.text = "\(DataManage.shared.wallet.count)"
            
            return cell
            
        }
        if(indexPath.row == 1){
            
            cell.detailTextLabel?.text = "\(DataManage.shared.coupon.count)"
            
            return cell
            
        }
        if(indexPath.row == 2){
            
            cell.detailTextLabel?.text = "\(DataManage.shared.card.count)"
            return cell
            
        }
         cell.detailTextLabel?.text = "\(DataManage.shared.referal.count)"
        
        return cell
    }
    

    @IBAction func dismiss(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       
        
        DataManage.shared.transactionValue =  indexPath.row
        
        print(DataManage.shared.transactionValue!)
        
        let target = storyboard?.instantiateViewController(identifier: "acc") as! FiltDataViewController
        
        present(target, animated: true, completion: nil)
        
        
    }
    
    @IBOutlet weak var filterTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        filterTableView.delegate = self
        filterTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
