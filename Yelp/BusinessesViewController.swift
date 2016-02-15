//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {

    var businesses: [Business]!
    var filteredData: [Business]!
    var searchController: UISearchController!

    
    @IBOutlet weak var myTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initializing with searchResultsController set to nil means that
        // searchController will use this view controller to display the search results
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        
        // If we are using this same view controller to present the results
        // dimming it out wouldn't make sense.  Should set probably only set
        // this to yes if using another controller to display the search results.
        searchController.dimsBackgroundDuringPresentation = false
        
        searchController.searchBar.sizeToFit()
        myTable.tableHeaderView = searchController.searchBar
        
        // Sets this view controller as presenting view controller for the search interface
        definesPresentationContext = true

        
        
        
        myTable.delegate = self
        myTable.dataSource = self
        myTable.rowHeight = UITableViewAutomaticDimension
        myTable.estimatedRowHeight = 120
        
        
        Business.searchWithTerm("Thai", completion: { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            self.myTable.reloadData()
        
            for business in businesses {
                print(business.name!)
                print(business.address!)
            }
        })
        
        

/* Example of Yelp search with more search options specified
        Business.searchWithTerm("Restaurants", sort: .Distance, categories: ["asianfusion", "burgers"], deals: true) { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            
            for business in businesses {
                print(business.name!)
                print(business.address!)
            }
        }
*/
    }
    
    func tableView(myTable: UITableView, numberOfRowsInSection section: Int) -> Int{
        if businesses != nil {
            return businesses!.count
        } else {
            return 0
        }
    }
    func tableView(myTable: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = myTable.dequeueReusableCellWithIdentifier("businessCell", forIndexPath: indexPath) as! BusinessCell
        cell.business = businesses[indexPath.row]
        
        return cell
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            Business.searchWithTerm(searchText, completion: { (businesses: [Business]!, error: NSError!) -> Void in
                self.businesses = businesses
                self.myTable.reloadData()
                
                for business in businesses {
                    print(business.name!)
                    print(business.address!)
                }
            })
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
