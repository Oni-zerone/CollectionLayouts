fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew cask install fastlane`

# Available Actions
## iOS
### ios ci
```
fastlane ios ci
```
Default CI lane
### ios lint
```
fastlane ios lint
```
SwiftLint linting
### ios pod_lint
```
fastlane ios pod_lint
```
Pod lib lint
### ios test
```
fastlane ios test
```
Runs all the tests
### ios coverage
```
fastlane ios coverage
```
Slather sends coverage to Coveralls
### ios clean
```
fastlane ios clean
```
Clean environment after all operations

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
