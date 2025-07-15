# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

必ず日本語で回答してください。

## Project Overview
This is an iOS project called "tick" built with SwiftUI. The project uses standard iOS development patterns with a simple app structure.

## Development Environment
- **Xcode**: 16.4 (Build version 16F6)
- **Swift**: 6.1.2 (Project uses Swift 6.0)
- **iOS Deployment Target**: 18.5
- **macOS Deployment Target**: 15.5
- **visionOS Deployment Target**: 2.5

## Development Commands

### Build and Run
- **Build**: `cd tick && xcodebuild -scheme tick -configuration Debug build`
- **Run**: Use Xcode to run on simulator or device (`⌘+R`)
- **Clean**: `cd tick && xcodebuild -scheme tick clean`

### Testing
- **Run Tests**: `cd tick && xcodebuild -scheme tick test -destination 'platform=iOS Simulator,name=iPhone 15'`
- **Run Unit Tests**: `cd tick && xcodebuild -scheme tick -only-testing:tickTests test`
- **Run UI Tests**: `cd tick && xcodebuild -scheme tick -only-testing:tickUITests test`

### Project Structure
The project follows standard iOS app structure within the `tick/` directory:
- `tick/tick/` - Main application source code
  - `tickApp.swift` - Main app entry point using SwiftUI App protocol
  - `ContentView.swift` - Main view displaying "Hello, world!" with globe icon
  - `Assets.xcassets/` - Asset catalog for images and colors
  - `tick.entitlements` - App entitlements configuration
- `tick/tickTests/` - Unit tests using Swift Testing framework
- `tick/tickUITests/` - UI tests for interface testing

## Architecture Notes
- SwiftUI-based application with declarative UI
- Uses Swift Testing framework (not XCTest) for unit tests
- Standard iOS app lifecycle with `@main` App struct
- Preview support enabled for SwiftUI components