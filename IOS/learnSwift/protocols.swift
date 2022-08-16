protocol SomeProtocol{
    var body: SomeProtocol { get }
}
struct Viw: SomeProtocol{
    var body: some SomeProtocol{
        return nil
    }
}