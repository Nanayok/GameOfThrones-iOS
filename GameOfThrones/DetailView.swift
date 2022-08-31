//
//  DetailView.swift
//  GameOfThrones
//
//  Created by Nana Yaw Owusu-Koranteng on 30/08/2022.
//

import SwiftUI

struct DetailView: View {
    
    let item: House
    
    var body: some View {

        VStack{
                    Text("Name:").font(.system(size: 15))
            Text(item.name).foregroundColor(.black).padding(.bottom, 10)
            Text("Region:").font(.system(size: 15))
            Text(item.region).foregroundColor(.black) .padding(.bottom, 10)
            Text("Coat of Arms:").font(.system(size: 15))
            Text(item.coatOfArms).foregroundColor(.black)
                }
    }
}

struct DetailView_Previews: PreviewProvider {
 
    static var previews: some View {
       // DetailView()
        let writerPreview = House(
            name: "Tiago",
            region: "Pereira",
            coatOfArms: "createwithswift.com"
            
        )
        
        DetailView(item: writerPreview)

    }
}
