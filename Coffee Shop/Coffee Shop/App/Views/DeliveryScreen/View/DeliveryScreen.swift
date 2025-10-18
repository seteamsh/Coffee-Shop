import SwiftUI

struct DeliveryScreen: View {
    var body: some View {
        ZStack {
            Image(.map)
                .resizable()
                .aspectRatio(contentMode: .fill)
            VStack(spacing: 0) {
                NavBar()
                Spacer()
                ZStack {
                    Rectangle()
                        .fill(.white)
                        .frame(height: 322)
                        .clipShape(
                            .rect(topLeadingRadius: 24, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 24))
                    VStack(spacing: 0) {
                        Rectangle()
                            .fill(.lightActive)
                            .frame(width: 45, height: 5)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .padding(.top, 16)
                        Text("10 minutes left")
                            .font(Font.custom(.sora, size: 16))
                            .fontWeight(.semibold)
                            .foregroundStyle(.grayNormalActive)
                            .padding(.top, 15)
                        HStack(spacing: 0) {
                            Text("Delivery to")
                                .font(Font.custom(.sora, size: 12))
                                .fontWeight(.regular)
                                .foregroundStyle(.grayLighter)
                            Text(" Jl. Kpg Sutoyo")
                                .font(Font.custom(.sora, size: 12))
                                .fontWeight(.semibold)
                                .foregroundStyle(.grayNormalActive)
                        }
                        .padding(.bottom, 25)
                        DeliveryProcess()
                        .padding(.bottom, 16)
                        DeliveryStatus()
                        DriverInfo()
                    }
                    .padding([.leading, .trailing], 24)
                    .frame(height: 322)
                    
                }
            }
        }
    }
}

struct DeliveryProcess: View {
    var body: some View {
        HStack(spacing: 0) {
            Rectangle()
                .fill(.readyStep)
                .frame(width: 71.25, height: 4)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.trailing, 10)
            Rectangle()
                .fill(.readyStep)
                .frame(width: 71.25, height: 4)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.trailing, 10)
            Rectangle()
                .fill(.readyStep)
                .frame(width: 71.25, height: 4)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.trailing, 10)
            Rectangle()
                .fill(.lightActive)
                .frame(width: 71.25, height: 4)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.trailing, 10)
        }
    }
}

struct DeliveryStatus: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.white)
                .frame(height: 77)
                .cornerRadius(12)
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(.lightActive, lineWidth: 1))
            HStack(spacing: 0) {
                ZStack {
                    Rectangle()
                        .fill(.white)
                        .frame(width: 56, height: 56)
                        .cornerRadius(12)
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(.lightActive, lineWidth: 1))
                    Image(.deliverIcon)
                        .resizable()
                        .frame(width: 44, height: 44)
                }
                .padding(.trailing, 16)
                VStack(alignment: .leading, spacing: 0) {
                    Text("Delivered your order")
                        .font(Font.custom(.sora, size: 14))
                        .fontWeight(.semibold)
                        .foregroundStyle(.grayNormalActive)
                    
                    Text("We will deliver your goods to you in the shortes possible time.")
                        .font(Font.custom(.sora, size: 12))
                        .fontWeight(.light)
                        .foregroundStyle(.grayLighter)
                }
            }
            .padding(EdgeInsets(top: 10.5, leading: 12, bottom: 10.5, trailing: 12))
        }
    }
}

struct DriverInfo: View {
    var body: some View {
        HStack(spacing: 0) {
            Image(.driverPhoto)
                .resizable()
                .frame(width: 56, height: 56)
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .padding(.trailing, 16)
            VStack(alignment: .leading, spacing: 0) {
                Text("Brooklyn Simmons")
                    .font(Font.custom(.sora, size: 14))
                    .fontWeight(.semibold)
                    .foregroundStyle(.grayNormalActive)
                Text("Personal Courier")
                    .font(Font.custom(.sora, size: 12))
                    .fontWeight(.regular)
                    .foregroundStyle(.grayLighter)
            }
            Spacer()
            ZStack {
                Rectangle()
                    .fill(.white)
                    .frame(width: 44, height: 44)
                    .cornerRadius(12)
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(.lightActive, lineWidth: 1))
                
                Image(.call)
                    .resizable()
                    .frame(width: 24, height: 24)
            }
        }
        .padding(EdgeInsets(top: 14, leading: 0, bottom: 16, trailing: 0))
    }
}

struct NavBar: View {
    @EnvironmentObject var router: Router
    var body: some View {
        HStack(spacing: 0) {
            Button {
                router.goToRoot()
            } label: {
                ZStack{
                    Rectangle()
                        .fill(.categoryNotActive)
                        .frame(width: 44, height: 44)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    Image(.left)
                        .resizable()
                        .frame(width: 24, height: 24)
                }
            }

            Spacer()
            Button {
                
            } label: {
                ZStack{
                    Rectangle()
                        .fill(.categoryNotActive)
                        .frame(width: 44, height: 44)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    Image(.gps)
                        .resizable()
                        .frame(width: 24, height: 24)
                }
            }

        }
        .padding(EdgeInsets(top: 68, leading: 24, bottom: 0, trailing: 24))
        .navigationBarBackButtonHidden()
        .environmentObject(router)
    }
}

#Preview {
    DeliveryScreen()
        .environmentObject(Router())
}
