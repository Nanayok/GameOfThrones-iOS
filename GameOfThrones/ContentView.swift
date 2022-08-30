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
//        ZStack{
//            Color.blue
//                .ignoresSafeArea()
//            Text("Content View")
//                .foregroundColor(.white)
//                .font(.system(size: 30))
//        }
        
        List(results, id: \.name) { item in
                    VStack(alignment: .leading) {
                        //Text(item.name)
                        //Text(item.region)
                        //Text(item.coatOfArms)
                        
                        HStack{
                            Image(systemName: "house")
                            Text(item.name)
                        }.onTapGesture {
                            print("----> " + item.name)
                            //DetailView(results)
                            //self.showDetailView.toggle()
                            
                        }
                        //Add a sheet modifier to present DetailView modally
//                        .sheet(isPresented: $showDetailView){
//                            //DetailView()
//                            //Use the new SecondView initializer
//                            DetailView(house: houseForDetailView)
//                        }
                    }
        }.onAppear(perform: loadData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
