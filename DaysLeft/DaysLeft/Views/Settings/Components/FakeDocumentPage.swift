//
//  FakeDocumentPage.swift
//  DaysLeft
//
//  Created by Baher Tamer on 21/01/2023.
//

import SwiftUI

struct FakeDocumentPage: View {

    let title: String

    var text: String {
        """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vulputate elit pulvinar libero accumsan, non malesuada massa varius. Etiam bibendum mattis metus nec dignissim. Aliquam vitae quam eget nulla condimentum vestibulum faucibus nec ex. Cras venenatis risus lectus, at faucibus tortor scelerisque finibus. Quisque a pellentesque ligula. Cras ac lorem velit. Maecenas neque ipsum, interdum sit amet libero ut, aliquam pellentesque arcu. Donec nec nibh et eros consectetur varius. Mauris consequat tortor non elit facilisis malesuada. Nunc vitae turpis sed sapien ullamcorper egestas scelerisque vel nunc. Vivamus non justo felis.

        Pellentesque a urna lacinia ante pharetra bibendum. Praesent ligula neque, sodales a nulla at, fringilla vestibulum leo. Vestibulum eu nunc posuere, convallis nulla quis, aliquet augue. Suspendisse facilisis laoreet justo, sit amet sodales mauris aliquam vel. Pellentesque neque dui, maximus sagittis arcu malesuada, vulputate rhoncus eros. Nunc finibus, elit id sodales lobortis, est lacus sodales diam, at imperdiet orci urna consequat ante. Quisque tincidunt sit amet ipsum a semper. Phasellus vel massa commodo ipsum hendrerit vestibulum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. In nunc augue, molestie a erat vel, hendrerit aliquet urna. Morbi vel lorem ac lectus sagittis volutpat rutrum quis nisl. Curabitur rhoncus mollis augue finibus condimentum. Maecenas hendrerit, lacus sit amet semper condimentum, tortor risus finibus metus, vitae dignissim lorem felis in ante. Nam non sem eu ex congue ultricies. Nunc ligula sapien, fringilla id auctor vestibulum, dapibus quis risus.

        Donec vulputate leo quis sem interdum, et porttitor risus lacinia. Fusce dignissim ipsum id fringilla efficitur. Pellentesque luctus at nisi non ultricies. Praesent augue magna, egestas vitae consequat nec, varius vel lacus. Quisque interdum turpis eu elementum dignissim. Nullam in sagittis ligula, vel fermentum orci. Phasellus ullamcorper consectetur orci eu commodo. Aenean ex nunc, ultricies ut erat sit amet, pretium mollis arcu. Suspendisse sit amet hendrerit magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. In dui sem, ullamcorper mattis felis eu, molestie facilisis nisi. Donec id sollicitudin felis.

        Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aenean a quam sed dui dictum dapibus. Donec lobortis ex quis augue commodo tempor. Nullam in ipsum libero. Morbi urna eros, tempus non faucibus id, condimentum a justo. Vestibulum ac aliquet nibh. In non mollis libero. Vivamus mollis eros in est mattis fermentum.

        Ut iaculis nibh tortor, eu consectetur leo sodales ac. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Donec tincidunt molestie aliquam. Aliquam laoreet ante finibus tellus pellentesque, a tincidunt magna sagittis. Aliquam nulla erat, pulvinar nec enim in, euismod gravida ante. In nunc felis, tincidunt eget ante sed, dapibus maximus nisl. Sed nec dui lectus. Cras posuere justo pharetra mi finibus vestibulum.
        """
    }

    var body: some View {
        ScrollView {
            VStack {
                Text(text)
                    .multilineTextAlignment(.leading)
                    .navigationTitle(title)
                    .padding(.horizontal)
            }
        }
    }
}

struct FakeDocumentPage_Previews: PreviewProvider {
    static var previews: some View {
        FakeDocumentPage(title: "")
    }
}
