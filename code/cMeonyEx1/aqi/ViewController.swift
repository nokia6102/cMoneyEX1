import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var aqiTabelView: UITableView!
    
    var timer: Timer!
    var refreshControl: UIRefreshControl!
    var buy2Go :[Ex1Money]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aqiTabelView.dataSource = self
        aqiTabelView.delegate = self
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(updateData), for: UIControl.Event.valueChanged)
        aqiTabelView.addSubview(refreshControl)
        
        //MARK: - fetch data in the first time
        getData()
        
    }
}


//MARK: - Fetch buy2GoData
extension ViewController {
    
    func getData() {
        if let url = URL(string: AQI_URL!) {
            
            let task = URLSession.shared.dataTask(with: url)
            {(data, response, error) in
                
                let decoder = JSONDecoder()
                
                if let data = data , let result = try? decoder.decode([Ex1Money].self, from: data){
                    
                    self.buy2Go = result
                    DispatchQueue.main.async {
                        self.aqiTabelView.reloadData()
                    }
                }
            }
            task.resume()
        }
    }
    
    @objc func updateData() {
        
        DispatchQueue.main.async {
            self.getData()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1){
                self.refreshControl.endRefreshing()
            }
        }
    }
}


//MARK: - TableView Setting
extension ViewController: UITableViewDataSource,UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if buy2Go != nil {
            return self.buy2Go!.count
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if buy2Go != nil {
            let cell = tableView.dequeueReusableCell(withIdentifier: "aqiCell", for: indexPath) as! AqiTableViewCell
           
            cell.productKey.text = String(buy2Go![indexPath.row].productKey!)
            cell.quantiy.text = String(buy2Go![indexPath.row].quantiy!)
            cell.aqiCellView.backgroundColor = UIColor.white
           
          
            return cell
        }else{
            
            let errorCell = tableView.dequeueReusableCell(withIdentifier: "errorCell", for: indexPath)
            
            return errorCell
        }

    }
    
    
    
}


