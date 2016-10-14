declare -A good
declare -A bad

goodemojis=(
  fire
  muscle
  pointright
  facepunch
  smile
  sunglasses
  thumbsup
  okhand
  winking
  vforvictory
  moon
  sun
  clap
)

bademojis=(
  rollingeyes
  pouting
  confused
  flushed
  middlefinger
  worried
  downthumb
  hushed
  triumph
  grimacing
  nervous
  scream
)

good[fire]=🔥
good[muscle]=💪
good[pointright]=👉
good[facepunch]=👊
good[smile]=😄
good[sunglasses]=😎
good[thumbsup]=👍
good[okhand]=👌
good[winking]=😉
good[vforvictory]=✌️
good[moon]=🌝
good[sun]=🌞
good[clap]=👏

bad[rollingeyes]=🙄
bad[pouting]=😡
bad[confused]=😕
bad[flushed]=😳
bad[middlefinger]=🖕
bad[worried]=😟
bad[nervous]=😰
bad[scream]=😱
bad[thumbsdown]=👎
bad[hushed]=😯
bad[triumph]=😤
bad[grimacing]=😬
>>>>>>> Add more emojis

# Get size
G=${#goodemojis[@]}
B=${#bademojis[@]}

# Random value
((G=(RANDOM%G)+1))
((B=(RANDOM%B)+1))

# Get random emoji names
G="$goodemojis[$G]"
B="$bademojis[$B]"

if [[ -n "$MY_GOOD_RAFIKI" ]]; then
  if [[ -n "$good[$MY_GOOD_RAFIKI]" ]]; then
    RAFIKI_GOOD=good[$MY_GOOD_RAFIKI]
  else
    echo "$fg_bold[red]$MY_GOOD_RAFIKI is invalid, setting a random one..."
    RAFIKI_GOOD="$good[$G]"
  fi
else
  RAFIKI_GOOD="$good[$G]"
fi

if [[ -n "$MY_BAD_RAFIKI" ]]; then
  if [[ -n "$bad[$MY_BAD_RAFIKI]" ]]; then
    RAFIKI_BAD=bad[$MY_BAD_RAFIKI]
  else
    echo "$fg_bold[red]$MY_BAD_RAFIKI is invalid, setting a random one..."
    RAFIKI_BAD="$bad[$B]"
  fi
else
  RAFIKI_BAD="$bad[$B]"
fi

local message="$fg_bold[green]$RAFIKI_GOOD  I'm your friend today. $fg_bold[red]$RAFIKI_BAD  I'm not your friend."

if [[ -z "$RAFIKI_QUIET" ]]; then
  echo "${message}"
fi

alias rafiki='echo "${message}"'
alias newrafiki='source ~/.zshrc'

local ret_status="%(?:%{$fg_bold[green]%}$RAFIKI_GOOD :%{$fg_bold[red]%}$RAFIKI_BAD )"
PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
