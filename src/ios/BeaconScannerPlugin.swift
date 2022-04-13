/********* BeaconScannerPlugin.m Cordova Plugin Implementation *******/

@objc(BeaconScannerPlugin) class BeaconScannerPlugin : CDVPlugin{

    // MARK: Properties
    var pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR)
    var timer = Timer()
    var commandTimer: CDVInvokedUrlCommand? = nil

    @objc(add:) func add(_ command: CDVInvokedUrlCommand) {
        var pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR)
        let param1 = (command.arguments[0] as? NSObject)?.value(forKey: "param1") as? Int
        let param2 = (command.arguments[0] as? NSObject)?.value(forKey: "param2") as? Int
        if let p1 = param1 , let p2 = param2 {
            if p1 >= 0 && p1 >= 0{
                let total = String(p1 + p2)
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: total)
            }else {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Please pass valid arguments")
            }
        }
        self.commandDelegate!.send(pluginResult, callbackId: command.callbackId)
    }

    @objc(timerStart:) func timerStart(_ command: CDVInvokedUrlCommand) {
        commandTimer = command
        self.timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }

    @objc func update() {
        // Something cool
        var pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR)
        pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: "Timer count")
        self.commandDelegate!.send(pluginResult, callbackId: commandTimer?.callbackId)
    }
}