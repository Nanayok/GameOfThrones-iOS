//
//  ContentView.swift
//  GameOfThrones
//
//  Created by Nana Yaw Owusu-Koranteng on 28/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    //Add a var to define whether DetailView should be showing
    //@State private var showDetailView = false
    
    //Since the response is an array of Houses object
    
    @State var results = [House]()
    
    @State var selectedItem: House? // <- track the selected item
    
            //Create the instance of house you want to pass to DetailView
//        var houseForDetailView = House(
//                name: "Giovanni",
//                region: "Monaco",
//                coatOfArms: "createwithswift.com"
//            )
    
    
    
    func loadData() {
            guard let url = URL(string: "https://www.anapioficeandfire.com/api/houses") else {
                print("Invalid URL")
                return
            }
            let request = URLRequest(url: url)

            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    if let response = try? JSONDecoder().decode([House].self, from: data) {
                        DispatchQueue.main.async {
                            self.results = response
                            //let _ = print(results)
                        }
                        return
                    }
                }
            }.resume()
        }
    
    
    var body: some View {

        NavigationView {
            
//        VStack{
//            Text("Game of Thrones")
//        }
        
        List(results, id: \.name) { item in
                    VStack(alignment: .leading) {
                     
                        NavigationLink(destination: DetailView(item: item)) {
                                            
                            HStack{
                                Image(systemName: "house").foregroundColor(.blue)
                                Text(item.name)
                            }
                        }.navigationTitle("Game of Thrones")

//                        .onTapGesture {
//                            print("----> " + item.name)
//
//
//                        }
   
                    }
        }.onAppear(perform: loadData)
        
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
