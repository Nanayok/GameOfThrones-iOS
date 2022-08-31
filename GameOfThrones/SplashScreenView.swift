//
//  SplashScreenView.swift
//  GameOfThrones
//
//  Created by Nana Yaw Owusu-Koranteng on 28/08/2022.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
//    //Since the response is an array of Houses object
//    @State var results = [House]()
//    
//    
//    func loadData() {
//            guard let url = URL(string: "https://www.anapioficeandfire.com/api/houses") else {
//                print("Invalid URL")
//                return
//            }
//            let request = URLRequest(url: url)
//
//            URLSession.shared.dataTask(with: request) { data, response, error in
//                if let data = data {
//                    if let response = try? JSONDecoder().decode([House].self, from: data) {
//                        DispatchQueue.main.async {
//                            self.results = response
//                            //let _ = print(results)
//                        }
//                        return
//                    }
//                }
//            }.resume()
//        }
    
    
    var body: some View {

//        List(results, id: \.name) { item in
//                    VStack(alignment: .leading) {
//                        Text(item.name)
//                        //Text(item.region)
//                        //Text(item.coatOfArms)
//                    }
//        }.onAppear(perform: loadData)
        
    
        if(isActive){
            ContentView()
        }else{
            VStack{
                VStack{
                    Image("ic_splash_logo")
                        .font(.system(size: 80))
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                    withAnimation{
                        self.isActive = true
                    }
                    
                }
            }
        }
          
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
