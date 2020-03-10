# NeumorphismUI

A description of this package.


## How to use

```swift
let neumorphism = NeumorphismManager(
    isDark: false,
    lightColor: Color(hex: "C1D2EB"),
    darkColor: Color(hex: "2C292C")
)

let contentView = ContentView()
    .environmentObject(neumorphism)
```

```swift
import SwiftUI
import NeumorphismUI

struct SimpleView: View {
    @EnvironmentObject var neumorphism: NeumorphismManager

    var body: some View {
        ZStack {
            neumorphism.color.edgesIgnoringSafeArea(.all)
            Circle()
                .fill(neumorphism.color)
                .frame(width: 200, height: 200)
                .neumorphismShadow()
        }
    }
}
```

![Simple View Light](https://lh3.googleusercontent.com/HzvANbBYq6ymdEqHlEXuwGgCWzmQGXJcCGeOAPmUJrFhyW-dUE0aM-W44jFGatvMpeYDOzHNQetVmkj6pIFxylY7xqrGEaGGEtT68sPKxx2T6ieOLWYHtgbc8m-qF5sQK5fbTskRT_ggO-fQzI7sBxq_DIYIoNAzFkY_U0gdEorFcH1rnfeDPwhC4Vemqrj5AENpKfog2llfDRmVibnumfy4dsq51aBvGEgF9LaQSjzQzkm_Mz8ZgYgkRamYoOKzM8ZzZH7difejlDb8L3JPec5a5LucrG70SYfzQYZYkeOoq8rplZ_x9a6Xq8sArZES-Kx4rIEYX1HgPyZL7jvjzAgbH_DJjdEp-gnz3Y083pNoskKcC4_OT_PNHTIo37w07NSaPVVfj-0hLUFfxARkkFQ5gRSsKYToXsuiDfyaNPw5I39Urz3BHmNaeWIcxni9xelZujTsW-KkM14RcBG2gtrklu9sIELDoNm8UV_mzHvuewaVgZr0TITnJH0LjLDxjF-Qqeytnu9HhGqBbReaK4UFwohrtcOd21REEojfpz0TZ9uuNsKNRaGqplcgYhPy48lDujX-irpahZFVFb5jKCkM8bUHpCse9lnMZTO9_mgvV4hh_2KXaUIJ6fVLAeiLrXvPI9NU6LrnPdvRj2y-B1JoAL_TSPUga3DqyTzagK76jAQh_rsJSVpAj7Sg4A2Ukf3_O2P2FMveyd47bj-ybzYVjgmHwKrB5bTwaupXUJXjjAROQQ=w377-h677-no)

```swift
let neumorphism = NeumorphismManager(
    isDark: true,
    lightColor: Color(hex: "C1D2EB"),
    darkColor: Color(hex: "2C292C")
)

let contentView = ContentView()
    .environmentObject(neumorphism)
```

![Simple View Dark](https://lh3.googleusercontent.com/aowkfsM8DhHCYOjKVqf_k22EeHBLYzj1-xyP2BJ6ygUFhdhzqGXfKaQlccC5U7pgwVtHxd-5IIVeLDH3z4YmbhPHLzVGBHPMDOZcZND2lFCXSakb0-naUInKy29KDmbW1WkLmKKpvFvF-isE06qX6bih2O_kt7Q5_Svn0AldDriq82huLgESCZpqPtxWW6-PmEdS_32ordPB7Y_c88poyvJEW7EnYWU-cteCSeQKGpfXssodgmg7HcWOdGHiTWBM2oD9oP2QYtE13tBovvOpQV4RPYAbJVlA92HzeGEJR_jUB4-8jTbp4zuKZIF_iZCMLbHB6IJocitTZ_eWC9V-LP8kFE5SLFxGCLOYh_FcvrVjdvcKIFXGLgFOwmT6Svlt0bTwqLjVmKrSDt_x01jq_WDVZbSNkayAp6Hy1XWUMb9BpO5c_HsJj876PJX35-bQXcXkwLvUMbHlcqG8EoGJb_3LUuhMDAAXV26NoweDyhG6fLLKiA8_uPM_Wbjx9S42tp9qM4joLpb5YzqDuTCKt_BVE0Ke1cyuTSdqyhN4nDhgVsTApNOsr7wgHGl_VfyYCBw8U9LFsObvTvTb11LDud9CNCYiB870iLTPBf3LEgleHa_v2OGzMe5VSauG7sVaeySO_sbIDWKuGzBgN7wmx17mn8Da5H72io4EEpW67Pk2LxPNB75QGL6EqZdaN3ZV6XezedkuYsFkTmV9Id_ghuAhVUKDCMqAi26nUxKj2b2ZCa2edQ=w377-h677-no)
