![](https://www.dropbox.com/s/u08c2zofducjvh9/rafiki-zsh-2.png?raw=1)

## Rafiki-zsh

Rafiki-zsh is a [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) theme that adds emojis to your zsh terminal.
Rafiki will display a `good` emoji such as :smile: on your prompt whenever commands run smoothly and `bad` emojis
such as :rage: whenever things go wrong.

##### Inspiration

If you've watched the American animated epic musical film: **Lion King** the name `Rafiki` will resonate well with you.

Introducing _Rafiki_

![rafiki](https://a.dilcdn.com/bl/wp-content/uploads/sites/25/2015/01/Rafiki-The-Lion-King-3.jpeg)

### Setup

To set up the theme. Ensure that you have [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) installed and setup on your terminal.

Clone the repo or download `rafiki.zsh-theme` file.

    $ git clone https://github.com/akabiru/rafiki-zsh


Copy `rafiki.zsh-theme` to `~/.oh-my-zsh/custom/themes/`. This is where your custom themes live.

    $ cp /path/to/rafiki.zsh-theme ~/.oh-my-zsh/custom/themes/

Change your zsh theme to rafiki in your `.zshrc` file.

    $ vim ~/.zshrc

    ZSH_THEME='rafiki'

Restart your terminal (or reload your terminal by running `$ source ~/.zshrc`) and Voila! Rafiki is watching over you.

### Usage

Rafiki generates random emojis every time you start up your terminal. It also tells you who your pals are for the session.

To generate a new set just run `newrafiki`

    $ newrafiki

You can also run `rafiki` to remind yourself your emoji set.

    $ rafiki

### Customization

Rafiki is pretty customizable.

If you prefer to have a constant set of emojis just set your `good`emoji and `bad` emoji in `.zshrc` as follows.

For good emojis, set `$MY_GOOD_RAFIKI` to one of the following: `fire muscle pointright facepunch smile sunglasses` and
your `bad` emoji to one of the following: `rollingeyes pouting confused flushed middlefinger worried`

    $MY_GOOD_RAFIKI='fire'
    $MY_BAD_RAFIKI='rollingeyes'

Then reload your zsh configuration.

    $ source ~/.zshrc

You can also add your own emojis to the supported set. Just add the emoji name to one of the arrays; `goodemojis` or `bademojis`.
Then add the emoji to the respective array with the name as the key and the emoji as the value.

Colors can also be customized by modifying the `$RAFIKI_FOLDER_COLOR`, `$RAFIKI_GIT_WRAPPER_COLOR` and `$RAFIKI_GIT_BRANCH_COLOR` variables. zsh defines the following colors for text on the terminal: `green`, `blue`, `cyan`, `black`, `red`, `magenta`, `yellow` and `white`. The three color variables can be set to any of these colors.

    $RAFIKI_FOLDER_COLOR=magenta
    $RAFIKI_GIT_BRANCH_COLOR=yellow
    $RAFIKI_GIT_WRAPPER_COLOR=green

To change the colors, navigate open via sublime (or any editor of your choice) and edit the three variables above.

    $ subl ~/.oh-my-zsh/custom/themes/rafiki.zsh-theme

### Contributing

Feel free to contribute, even if it's to add an emoji. :wink: Just fork it :fork_and_knife: and raise a pull request.

### Credits

This projects borrows from [Robby Russell's](https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/robbyrussell.zsh-theme) theme.
Not forgetting [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) itself. :smile:
