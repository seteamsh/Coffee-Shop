import SwiftUI

class DetailScreenModel: ObservableObject {
    @Published var isMore: Bool = false
    func lineLimit() -> Int {
        isMore ? .max: 3
    }
    func toggleMore() {
        isMore.toggle()
    }
    func textMore() -> String {
        isMore ? ReadState.less.rawValue : ReadState.more.rawValue
    }
}

struct DetailScreen: View {
    @StateObject var model = DetailScreenModel()
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Button {
                    
                } label: {
                    Image(.back)
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                .padding(10)
                    

                Spacer()
                Text("Detail")
                    .font(Font.custom(.sora, size: 16))
                    .fontWeight(.semibold)
                    .foregroundStyle(.grayNormalActive)
                Spacer()
                Button {
                    
                } label: {
                    Image(.favorite)
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                .padding(10)

            }
            .padding(.top, 24)
            Image(.fullCaffeMocha)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 202)
            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Caffe Mocha")
                        .font(Font.custom(.sora, size: 20))
                        .fontWeight(.semibold)
                        .foregroundStyle(.grayNormalActive)
                        .padding(.bottom, 4)
                    Text("Ice/Hot")
                        .font(Font.custom(.sora, size: 12))
                        .fontWeight(.regular)
                        .foregroundStyle(.grayLighter)
                        .padding(.bottom,  16)
                    HStack(spacing: 0) {
                        Image(.star)
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("4.8")
                            .font(Font.custom(.sora, size: 15))
                            .fontWeight(.semibold)
                            .foregroundStyle(.greyNormalHover)
                        Text("(230)")
                            .font(Font.custom(.sora, size: 12))
                            .foregroundStyle(.grayLighter)
                    }
                }
                Spacer()
                HStack(spacing: 0) {
                    Superiority(logo: .fastDelivery)
                        .padding(.trailing, 12)
                    Superiority(logo: .qualityBean)
                        .padding(.trailing, 12)
                    Superiority(logo: .extraMilk)
                }
                .padding([.top, .bottom], 20)
            }
            .padding(.bottom, 16)
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(.lightActive)
                .padding([.leading, .trailing], 16)
            Text("Description")
                .font(Font.custom(.sora, size: 16))
                .fontWeight(.semibold)
                .foregroundStyle(.grayNormalActive)
            Text("A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85 ml of fresh milk. The foam on top, made from steamed milk, adds both texture and sweetness to the drink. Traditionally served in a ceramic cup, the cappuccino is known for its perfect balance between bold espresso and creamy milk.")
                .font(Font.custom(.sora, size: 14))
                .fontWeight(.light)
                .foregroundStyle(.grayLighter)
                .lineLimit(model.lineLimit())
            Button(action: {
                model.toggleMore()
            }, label: {
                Text(model.textMore())
                    .font(Font.custom(.sora, size: 14))
                    .fontWeight(.semibold)
                    .foregroundStyle(.brownNormal)
            })
                .font(Font.custom(.sora, size: 14))
                .fontWeight(.light)
                .foregroundStyle(.grayLighter)
            Text("Size")
            
            Spacer()
            
        }
        .padding([.leading, .trailing], 24)
    }
}

enum ReadState: String {
    case more = "Read more"
    case less = "Read less"
}

enum SuperiorityLogo: String {
    case fastDelivery
    case qualityBean
    case extraMilk
    
}
struct Superiority: View {
    var logo: SuperiorityLogo
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 44, height: 44)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .foregroundStyle(.categoryNotActive)
                .opacity(0.35)
            Image(logo.rawValue)
                .resizable()
                .frame(width: 20, height: 20)
        }
    }
}



#Preview {
    DetailScreen()
}
