var exec = require('cordova/exec');

// exports.coolMethod = function (arg0, success, error) {
//     exec(success, error, 'BeaconScannerPlugin', 'coolMethod', [arg0]);
// };

module.exports.add = function (arg0, success, error) {
    exec(success, error, 'BeaconScannerPlugin', 'add', [arg0]);
};

module.exports.timerStart = function (success, error) {
    exec(success, error, 'BeaconScannerPlugin', 'timerStart');
};
