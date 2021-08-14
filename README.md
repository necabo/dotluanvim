# A wild Neovim configuration appears...

Reader uses "But you already have 3 different (Neo)vim configurations"!
It's not very effective...

Yes, it's that time again.
Yet another Vim configuration.
But this one is different, I swear.
In fact, this isn't even a Vim configuration.
It is a Neovim configuration.
That's wildly different, I know.
It's also entirely written in Lua because fuck VimL.

## Install

```shell
cd ~
mv .config/nvim .config/nvim.bak  # backup current neovim configuration if present
git clone https://github.com/necabo/luanvim.git .nvim
cd .nvim && nvim --headless +"autocmd User PackerComplete quitall" +"PackerSync"
```

NOTE: This will likely cause some weird output as it's trying to compile Treesitter grammars in a post-install hook.
There is currently no way to wait for these to finish but it also doesn't really matter if they don't.
Treesitter will automatically finish setting itself up the first time you start Neovim.

## Why another configuration?

Why another configuration in the first place?
What's wrong with [my current configuration](https://github.com/necabo/dotcocnvim)?

TL;DR: Nothing actually.
In fact, it's so good that I never went back to [either](https://github.com/necabo/dotnvim) [of](https://github.com/necabo/dotvim) my old configurations.
I'll still add some rambling about my experience configuring (Neo)vim because why not ¯\\\_(ツ)\_/¯

### Lessons learned

Configuring (Neo)vim can be incredibly time consuming.
There are tons of plugins that can be configured in various ways.
Combining multiple plugins can be very rewarding and smooth as well as problematic or downright impossible.
To be fair though, the majority of plugins are written with great care to not cause any issues when using them with other plugins.
While that allows for incredible customization it also manifests itself as one giant time sink.
There are always workflows to improve and new plugins to discover.

This is what ultimately made me switch to [coc.nvim](https://github.com/neoclide/coc.nvim) and its extension system in my current configuration.
It provides a unified interface for everything you would expect from your regular code editor like VSCode.
In fact, it pretty much provides exactly what VSCode Plugins would provide.
For most of this language support it utilizes the [Language Server Protocol (LSP)](https://microsoft.github.io/language-server-protocol/).
All that's left is setting up keybindings for some of the more useful features exposed from the LSP as well as some miscellaneous settings unrelated to language servers.
No more all nighters trying to find *the perfect™* configuration.
Awesome!

### Lessons not learned

Using my time productively.

### Conclusion

Configuring (Neo)Vim is fun.
I'm sorry if you read this far and were expecting some useful insight.
I'm sorry if you read this far and were expecting a more convincing or perhaps rational reason to start yet another configuration from scratch.
There really is none.
It's that rabbit hole you fall down at first and willingly continue to go down later knowing that you're wasting your time for very little gain.

And it's that time again.
Neovim 0.5 was released very recently and native LSP, Treesitter and first class Lua support got me excited about it.
So here I am pulling yet another all nighter to set up yet another Neovim configuration.
Yes, it's totally worth it already!
Thanks for asking!
