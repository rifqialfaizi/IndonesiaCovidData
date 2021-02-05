//
//  ContentView.swift
//  FetchJSONCovid
//
//  Created by Rifqi Alfaizi on 04/02/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var fetch = ApiService()
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack {
                    ForEach(fetch.dataTotal){data in
                        //Kolom 1
                        VStack(spacing: 10){
                            HStack{
                                Spacer()
                                VStack{
                                    Text("Positif").font(.headline).foregroundColor(.white)
                                    Text("\(data.jumlah_positif)").font(.headline).foregroundColor(.white)
                                }
                                Spacer()
                            }.frame(height:100).padding().background(Color.red).cornerRadius(20)
                            
                            HStack{
                                Spacer()
                                VStack{
                                    Text("Dirawat").font(.headline).foregroundColor(.white)
                                    Text("\(data.jumlah_dirawat)").font(.headline).foregroundColor(.white)
                                }
                                Spacer()
                            }.frame(height:100).padding().background(Color.yellow).cornerRadius(20)
                        }
                        // Kolom 2
                        HStack(spacing:10){
                            HStack{
                                Spacer()
                                VStack{
                                    Text("Sembuh").font(.headline).foregroundColor(.white)
                                    Text("\(data.jumlah_sembuh)").font(.headline).foregroundColor(.white)
                                }
                                Spacer()
                            }.frame(height:100).padding().background(Color.green).cornerRadius(20)
                            
                            HStack{
                                Spacer()
                                VStack{
                                    Text("Meninggal").font(.headline).foregroundColor(.white)
                                    Text("\(data.jumlah_meninggal)").font(.headline).foregroundColor(.white)
                                }
                                Spacer()
                            }.frame(height:100).padding().background(Color.black).cornerRadius(20)
                        }
                        Spacer()
                    }
                }.padding()
                
                // kalo data belom ke load, tampilkan Indicator
                if(fetch.isLoading){
                    VStack{
                        Indicator()
                        Text("Please Wait...")
                    }.padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color: .secondary, radius: 20, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                }
            }
            .navigationBarTitle("Covid19 Data")
        }

    }
}

       // Komponen Indikator Loading
        
struct Indicator : UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<Indicator>) -> UIActivityIndicatorView {
        let indi = UIActivityIndicatorView(style: .large)
        indi.color = UIColor.red
        return indi
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Indicator>) {
        uiView.startAnimating()
    }
}




        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }

