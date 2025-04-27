import SwiftUI

struct Home: View {
    var progress: CGFloat = 0.65
    @State private var selectedBodyPart: String = "목"
    let bodyParts = ["목", "어깨", "허리"]

    var body: some View {
        NavigationStack {
            ScrollView {
                // Hello User
                HStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.blue)
                        .frame(width: 157, height: 43)
                        .overlay(
                            Text("Hello, User!")
                                .foregroundColor(.white)
                                .bold()
                                .font(.system(size: 24))
                        )
                        .offset(x: -10, y: -30)
                    
                    
                }
                .padding()

                // 오늘의 챌린지
                VStack(alignment: .leading) {
                    Text("오늘의 챌린지")
                        .bold()
                        .font(.title2)
                        .padding(.leading)

                    VStack(spacing: 0) {
                        Image("척추의길")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 160)
                            .clipped()

                        VStack(alignment: .leading, spacing: 8) {
                            Text("척추의 길")
                                .font(.headline)
                            Text("26개 척추뼈와 함께하는 26일 습관형성")
                                .font(.subheadline)
                                .foregroundColor(.gray)

                            ZStack(alignment: .leading) {
                                Capsule()
                                    .frame(height: 6)
                                    .foregroundColor(Color.gray.opacity(0.3))
                                Capsule()
                                    .frame(width: 300 * progress, height: 6)
                                    .foregroundColor(.black)
                            }
                            .padding(.top, 4)
                        }
                        .padding()
                    }
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                    .frame(width: 370)
                    .padding(.horizontal)
                }
                .padding(.bottom)

                // 스트레칭 섹션
                VStack(alignment: .leading) {
                    Text("스트레칭")
                        .bold()
                        .font(.title2)
                        .padding(.leading)

                    // 선택 탭 버튼 UI
                    HStack(spacing: 7) {
                        ForEach(bodyParts, id: \.self) { part in
                            Button(action: {
                                selectedBodyPart = part
                            }) {
                                Text(part)
                                    .font(.system(size: 16, weight: .medium))
                                    .frame(width: 30)
                                    .foregroundColor(selectedBodyPart == part ? Color.white : Color.white)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 10)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(selectedBodyPart == part ? Color.blue : Color.gray.opacity(0.3))
                                    )
                            }
                        }
                    }
                    .padding(.bottom, 6)
                    .padding(.horizontal)

                    // 선택된 부위에 따라 StretchingCard 직접 표시
                    switch selectedBodyPart {
                    case "목":
                        StretchingCard(
                            imageName: "목스트레칭",
                            title: "거북목 스트레칭",
                            description: "현대인의 고질병, 거북목 타파하기!"
                        )
                    case "어깨":
                        StretchingCard(
                            imageName: "어깨스트레칭",
                            title: "어깨 풀기",
                            description: "굳은 어깨를 부드럽게 풀어봐요!"
                        )
                    case "허리":
                        StretchingCard(
                            imageName: "허리스트레칭",
                            title: "허리 강화 스트레칭",
                            description: "허리 통증 예방을 위한 필수 루틴"
                        )
                    default:
                        EmptyView()
                    }
                }
                .padding(.bottom)
            }

            // 툴바
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("검정 거북이")
                        .resizable()
                        .frame(width: 50, height: 30)
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "person.crop.circle")
                        .font(.system(size: 25))
                }
            }


                Divider()
            }
        }
    }


#Preview {
    Home()
}
