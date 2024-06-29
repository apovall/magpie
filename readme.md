# Magpie 
Magpie is a single file, all in one serial comms *inspector* and basic interrogator.
It's purpose is to help you, the embedded engineer, work with the not-embedded-engineer, to help trouble shoot devices that that your customers have access to, but you do not. These not-embedded-engineers, bless their souls, may not be as technically capable as you, so Magpie is intended to help them connect a device to serial comms in a clean and simple way, so you can get some debugging information out of it.

Magpie allows users to:
- Copy and paste the table (gross, but works).
- Email it to you.
- Do a shared video call while you guide them through it.

It's not an earth shattering invention, but will hopefully save you a bit of hassle with troubleshooting end user problems.


## TODO:
- Support for closing the port if the device is physically disconnected.
  - [disconnect event](https://developer.mozilla.org/en-US/docs/Web/API/SerialPort/disconnect_event)
- [x] Remove read and write lock feedback.
- [] Look at better minifiers, such as [minify-html](https://github.com/wilsonzlin/minify-html)
- [] Tidy up code to be less verbose
- [] Incorporate build tools to do minification step in repo.
- [] Incorporate `devConfig` into HTML
- [x] Add ability to email serial output to developer
- [x] Improved basic styling
- [] Add more styling options for end users. 
- [] Use flexbox for baud rate and command terminator options