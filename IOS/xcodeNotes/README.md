# Development Tools in XCode
1. Simulator - run app on a simulated iphone/ipad/apple watch/apple tv etc. [Simulator Help](https://help.apple.com/simulator/mac/current/)
2. Instruments - profiling, testing code, improve performance, spot memory issues. [Instruments Help](https://help.apple.com/instruments/mac/current/)
3. CreateML - training of custom ML models. [Create ML](https://developer.apple.com/documentation/CreateML)
4. 3D Content with **Reality Composer** - 3D compositions and AR. [Reality Composer](https://developer.apple.com/documentation/RealityKit/creating-3d-content-with-reality-composer)

- **Why is the organization identifier a reverse DNS string?**

- Why are Product name and Organisation identifier compulsory fields in Xcode?
     - used in creating the bundle ID
     - bundle ID used to register an App ID when this app is used on a device.
     - Org Identifier cannot be changed once build is uploaded to the App Connect.
        - `Can it be changed on the next build?`

- User Interface = SwiftUI if you want to an interactive preview of your app-code.