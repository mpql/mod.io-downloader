## Summary

Wanted to grab some mods for a game, couldn't download without being logged into mod.io via the game client. I get the value-add for game developers to not have to code their own multi-platform mod store, but for users, this is so much more annoying than e.g. ThunderStore + r2modmanager — especially if you're trying to set up a dedicated server

This is written in PowerShell, since games are usually written for Windows first, and I figure that's what users will be using. I may add a bash version later.

## Usage

You'll need an [API Key](https://mod.io/me/access). Fill out the `$api_key` variable with yours.

The default `$api_url` of `https://api.mod.io/v1` should work, but if not, throw in your dedicated `https://u-nnnnnnnn.modapi.io/v1` URL, and that should sort you.

Then, just invoke like this:

```PowerShell
.\mod.io-downloader.ps1 "Game Name" "Mod Name"
```
...and you should receive a URL. This may not work correctly for every mod, but should for most.

## Credits

This is loosely based on a list of commands from ["DiickJones"' YouTube video on the subject](https://www.youtube.com/watch?v=zfeEXOpCIVA).
