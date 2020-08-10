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

#### From source
3. Add `NetworkLogger.swift` to you project

#### Swift package manager
3. Add the git url as a swift package

## Usage
1. Start the server by running ```node server.js``` from the terminal
2. Set `NL.serverIP` to your desired IP address. The default is `https://127.0.0.1:8080`. Make sure to include the port!
3. Call `NL.log("message")` to log a message to the server
4. A new entry should appear in the terminal running the server