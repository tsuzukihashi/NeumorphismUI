# NeumorphismUI

NeumorphismUI is a very useful library that allows you to easily use Neumorphism designs in SwiftUI.

## DemoApp

![DemoApp Light](https://lh3.googleusercontent.com/7p5R69dgYewih6ErvQaGviO1C1o7GbbsB3TtBdDsmtYo1P8bVLlsdym0M4TpA8nmd6OrGsfFb3fb5KMdDcWqqQ5DDQZt2bbWieYBJFMVtyt_VmkoPQBL4Xn2A3T_gzpICYHBdh7epTbzC-TLC0qDTcBMUO4taBN9jMzoAdlvps91dsWJDAelYFw7nR4NzOYRg3TH1ox7pFkoK-V8no-bG2Vr761vp7rQ55_YIhhNguD3qm2CkyToTqj59y2oFksvq3CYzVFYINP19yL8n8JM-A0ZljnGW_ZzkgFsqbS-aQIrpxcjGY5MNCoLNxO_3IckG2O4Kx7W5QBlRJWPhVUk-RhKnZbSLsWyRBkdSnWCfXAQR0hDMlYRwAXPglHIMg6UXYb0E_jlgIpT3xJ4h4de_KVCpXlanYcsslgN7Ig_onZqjU9m64jmSi734cJHGv-eAambo5k32giaLWKXnkbH-w769dk_HPeXkfQLPR5dQyLoM4X1lG_qkFRmMER5jQBxkaWS9gUWlcABqO9kP1OUVtjiLRvq9ClNAcxk4BDbRPnfVFWhRpp6AqhU0PqiPh-DhFfx-OOrqlqoQ6diUNC9WFL0ZE33_QrUA_O6Ep9VSTqzp-0zNWh9cTFpbEfHxBIogh9sZwUCoZAwcIfCi0Sfzn72_pIVA1DvLjkSOnQ19Vi2N4KoWhY2L-ZRGctXLOWXN74nN6n3f8ld2X-vkJGTfaL3t5sw0kPA6jNm9bGMMegCk10CrzyLz48L=w218-h472-no)![DemoApp Dark](https://lh3.googleusercontent.com/p32Zm1UQZn67d5a4TFK9AKubF6P-x0qrTaH9Bo2pIpbbO58EY0_ShvYkN_1gbqcOurfAtpoGw84kzj7xW0GTX_3CKpdk2bdNAsFjT8UgnnWSewWGLEcSNdISf6LeQzrx9t5XOBl8Vt8tMDbl0i6YIhG58VszTcPkzdkJGQW7LdSFTeShaXwiXkLNwS1nVYcg-H1-k0gqEVeWTzjSlknUHrq25pc_QvdRJwxQo6aPl1Sh2EExOA0AUB5St3Trf9Eoa3y5An5p0AiaYdeUDp3UeE73vUXd_hOlIy6-FijLmCMPjE5Q5c3c1UV9UWaBVUCCQdFS-40cfszDjayESP38475X0lccEUkLelJgW_alBT-wEpmRBtL0RNVjAS2mhUQcYKyRsSZqiCngkOc5jmCMn-1HFCF2Cv_vy-rpKTO2ZaS0Z9Qkxm0ExOju7uy4a41EMBx_LdNxtjJV5l0vTHZAiMv94rSFixXoIiatw3r1dP1v4u1xxcGbleKqe32CrWugNKOBPan_EA6sPpQuAHiUq8QsA-VYOncUYdb_VVtHG8mg-Mv23bPD5tiP4CqyGUjdBqpgRB9y-lOu2MDstziJTfEo7C9bMbWDzhB03jgQTxQrH2828BzPnyelcOP0R86ddont8YAN_o2iYmjC7lIbHSPO-Q1S9ckCJfAkWOpHSu-Iikhrl_J2xgWC8ev-9bebINHVHyDpOyZJSXM75UNB8iuZoAxNAhDogJjVK0iJTHOfavym3lp_oRdy=w218-h472-no)

## Requirements

+ iOS 13.0+
+ Xcode 11+
+ Swift  5+

## Installation

### Swift Package Manager


## Usage

### Simple

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

### NeumorphismButton

```swift
NeumorphismButton(
    shapeType: .roundedRectangle(cornerRadius: 20),
    normalImage: Image(systemName: "star"),
    selectedImage: Image(systemName: "star.fill")
)
```

![Simple Use NeumorphismButton](https://lh3.googleusercontent.com/O8FJWsok-zSCk6YzSVIQuZujVcTNeyNRuYc-OOicDlVUIChbVNDI7Ftlipdk7WOYyAg4uWzjsPnDLxhUYbQvqduR09gxfLzylmKSv47OgC__L6B6Afa5LqC3TxwYISmdQ2XBIEfuyWZf-fBWj27NMsfPfhy23FI8PwZsMZ6DafzJfyvAEXn6FV5dytZwf4CDqczXRFlniAvW23GTqKsg185qwspN2optyYR7KdYoai4TARzoc-TlLgYhnyCAEH0-stH3BH7XSjCpNe4aPe5Niub067Kf8LLdDio2K38BPfN4VDTq2P1KYF4Ahdgbcj3bw9zOIaBlTAQxcSclKrvJ-1Esp77-DFwqDEWu3vPNTulBOrx5m9cnojQo6wHG7hyb-cmIaRLZFeXLvhgKMDJobgeoGvkpDyCLv03bN4xMOqUCJvNGCNfQ6LB4fPm80uS5FAM06_4qesKreX2Ihn5DAkhV99K814h9D1y-t9K7o6iGxslrCq134moRa5Ppenz1mTl2XWsmipDaixAvqet5qrkQW0Ph3fLCjsiulwtbtCvXHxvAaqqvNS10G1Eh4fMavSMJi5ztLghkS-bQM0UgpDO4RS0E8XzbzxQ5tDnU0e7cIv1tqsWIgGTajeT-lUVhAFShRjlIDnccTuOz6dHQ4XwEFbojt7C99jY75p3NQxFvijpyOYsBtIxybcQ6pgb-vAq6nb1HXAiOjIdDm8bFOiEQC1aAvH41YbGq7utrHaEStJGsVQ=s256-no)

## NeumorphismSlider


Simple Usage!

```swift
struct NeumorphismSliderView: View {
    @EnvironmentObject var neumorphism: NeumorphismManager
    @State private var value: Double = 0
    
    var body: some View {
        ZStack {
            neumorphism.color.edgesIgnoringSafeArea(.all)
            VStack {
                Text("VALUE: \(value)")
                    .foregroundColor(self.neumorphism.fontColor())
                
                NeumorphismSlider(value: self.$value, changeHandler: {
                    // call change method
                }) {
                    // call ended method
                }
            }
        }
    }
}
```

![NeumorphismSlider](https://lh3.googleusercontent.com/ysSXR8ooZy4X42bBkO-Mrr_0N78RTizBpRpfyHMn5N9TtJoCfEUR-9KxDanfshKlhUaFhZXM_OdM-9Q_jduBE4w0HmotYYrC6uGGiKa_FulHsmA85RWkjg10oGyIsKzcUZPxz6FYTlJ2OEug7GnJlc_Dwk8SeZPS3HsnYUFxsnIRSAXuImqGQPeAJho3rMrS-kUqs8ZR0ITjXtRWBRpqbBWOZvfynsQ2ZjA9CEbwKSIom5dF3x8bB4z1BhuP5kBUsXZB0pahQYGc4nFUu6DXc34mDq88E5VqBqaLQqPY3nhv7HxkpbXoYh6T2ztkPK1L67apJT0YJq0zmctVcgok4Oa8dq7v9WlstqR1Q_DTSg35ixLdzQPMfCNJagrqq-i8gqGoAZm5xnwyxy1v15fMrZhNP3sAhkJSLB2WtxbAu8CZ1cnYC3yObY68yYLmiY-VefwSu6yMEuxo4a_mM0jtk2YuN84wuCpbOT-aeV7UIRi0XwwoM6xJZVGyvWu7Awmk3TfkHBlcVwEOvzdBirzI77yI4RAu0W7NK1mqhza7FVaBJDYtegKPYUc-oMJFGOG1-NVYfQzWLi4DyB7isMMzGr1sz1vS3JrYBGdOLgyRGFSLBMBBQoKc52VZ8hQF1wWFRl_jJ8rHqozRoQn8lS0mIiUMpwiFTgx4NXEENNVSZMXFiNGLig0doCo3G2QXipJi9E8WfkMe4hpbJCsYDchPJHc1K5JnjmPt1B0Lw3hJfE-XIC_ArrmkKewp=w218-h472-no)
