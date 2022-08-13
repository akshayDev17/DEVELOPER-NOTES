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

- [Cocoa Template extra configurations](https://developer.apple.com/documentation/xcode/managing-files-and-folders-in-your-xcode-project)
- **What is a group in XCode Project?**

- Group with Folder does appear if you see its path in terminal, group without folder doesn't appear as a disk.
        - the components(files) belonging to a group without folder will appear as files in the same directory as that where the group-without-folder was added to.
        - Groups without folders are used mainly to organize resources(source files etc. )  inside xcode , which is rather not required on disk.
        - [**Important**](https://developer.apple.com/documentation/xcode/managing-files-and-folders-in-your-xcode-project) Source control == version control.
        - Remove reference - removes them from Xcode, not from disk.
- [Why mutliple projects for your app are better than a single giant one?](https://developer.apple.com/documentation/xcode/managing-multiple-projects-and-their-dependencies)

# XCode - Build a project
1. [What is a target?](https://developer.apple.com/documentation/xcode/building-and-running-an-app)
2. Use of a new Target?
3. Use of a new Build Scheme?
**Note on Simulators**: provide quick turnaround times, but not the performance of an actual target device.
4. 