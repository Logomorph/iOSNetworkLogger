# iOSNetworkLogger
Log messages to a node.js server for debugging

## Overview
I made this while implementing background upload and download in iOS apps, in order to easily log messages when testing background completions.

It supports `swift` only, it can't log from Objective-C. The `log` method supports the same arguments as the `print` method, so you can log as usual.

## Prerequisites
1. Install Node.js: https://nodejs.org/en/download/
2. The Node.js server needs the `ip` module to work. It's used for printing the local ip when the server starts. In order to install it, run:
```
npm install ip
```
3. Add `NetworkLogger.swift` to you project
## Usage
1. Start the server by running ```node server.js``` from the terminal
2. Open `NetworkLogger.swift` and change `let serverIP = "127.0.0.1:8080"` to match your desired ip (make sure to include the port!)
3. Call `NL.log("message")` to log a message to the server
4. A new entry should appear in the terminal running the server