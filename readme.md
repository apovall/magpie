# Magpie 
Magpie is a single file, all-in-one serial comms *inspector* and basic interrogator.
It's purpose is to help you, the embedded engineer, work with the not-embedded-engineer, to help trouble shoot devices that that your customers have access to, but you do not. Magpie is intended to help them connect a device to serial comms in a clean and simple way, so you can get some debugging information out of it.

## Features
- Single HTML file that includes all styling and JS necessary to use the Web Serial API
- Is reasonably small (13KB uncompressed, 10KB minified, 4KB compressed)
- Allow for basic configuration of the page via the `devConfig` object
- HTML file can live in simple storage on your device
- Easy copy and paste the serial comms data table into an email (email address configurable in the `devConfig` object)

## Use Cases
- If you have onboard non-volatile storage, then make a copy of `mapgie.html` (maybe rename the file name) and drop it on there. Ship it with every unit, so it's just ready to go when you need.
- If you don't want to ship it with every unit then just email it to users and get them to run it locally.
- Magpie should play very nicely with remote video call comms, so guiding non-technical users through the process should be reasonably straight forward.

## How to use
1. Just drop `mapgie.html` onto a local PC that has physical access to the device you want to access.
2. Open the HTML file
    - If you are running an unsupported browser (basically anything other than Chrome, Edge and Opera), you'll get a warning message
      - If that happens, get the end user to just copy the file path (in the address bar) and paste into an appropriate browser.
    - If you are running Chrome, Edge or Opera, you'll see some device / developer details (see Customisation below)
3. Select your baud rate and command terminator
4. Click Connect
   device dumps any comms onto the bus on power, but before connecting to it, you obviously won't see those.  
5. You can send any commands to the device via the 'Send Command' field and button. 
    - Commands are are automatically terminated with your chosen terminator above (this does largely assume that you consistently use the same for both reads and writes)
6. You can copy the output table via the 'Copy Output' button
7. Clicking the 'Email output' button will open the user's email client, and allow them to paste in the copied table output into the email.
    - If you nominated an email address in `devConfig`, this will be automatically populated for you in the `to` field.


## Customisation
- Search for the first instance of the `devConfig` object in the `magpie.html`, and add or leave as blank strings the fields you don't want to populate.
  - Not everyone likes having their emails exposed to all clients, although an email alias might be handy. Your call.
- Customisable fields include:

```
    name: "<John Example>",
    email: "<example@example.com>",
    deviceName: "<Customisable Heading>",
    devDetail: "<customisable paragraph to provide additional information to users>"
```


## Further Minification
If you need to eke out a bit more size optimisation (and don't want to compress the object), then you can copy and paste all of `magpie.html` content into a basic minifier [this one](https://www.minifier.org/), which will decrease the HTML file from ~13KB to ~9KB.

If you want to do this:
1. Make your desired changes on `magpie.html` first, as the minified code becomes considerably less readable.
2. Copy and paste the contents into [the minifier](https://www.minifier.org/). As always be careful to not include any sensitive information.
3. Grab the minified output
4. Create a new HTML file, and paste the contents into it. Save.

If you are going down the compression route, there's little benefit to the minification step, as they both compress to ~4KB. 

## TODO:
- [ ] Support custom command terminators
- [ ] Incorporate build tools to do minification step in repo.
  - [ ] Look at better minifiers, such as [minify-html](https://github.com/wilsonzlin/minify-html)
- [ ] Add more styling options for end users. 
- [ ] ~~Use flexbox for baud rate and command terminator options~~ (opting not to, to prioritise file size minimisation)
- [x] Incorporate `devConfig` into HTML
- [x] Make only output table overflow, not entire container
- [x] Tidy up code to be less verbose
- [x] Support for closing the port if the device is physically disconnected.
- [x] Remove read and write lock feedback.
- [x] Improved basic styling
- [x] Add ability to email serial output to developer
