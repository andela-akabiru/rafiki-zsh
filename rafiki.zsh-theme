declare -A good
declare -A bad

RAFIKI_FOLDER_COLOR=blue
RAFIKI_GIT_BRANCH_COLOR=magenta
RAFIKI_GIT_WRAPPER_COLOR=red

goodemojis=( fire muscle pointright facepunch smile sunglasses )
bademojis=( rollingeyes pouting confused flushed middlefinger worried )

good[fire]=🔥
good[muscle]=💪
good[pointright]=👉
good[facepunch]=👊
good[smile]=😄
good[sunglasses]=😎

bad[rollingeyes]=🙄
bad[pouting]=😡
bad[confused]=😕
bad[flushed]=😳
bad[middlefinger]=🖕
bad[worried]=😟

# Get size
G=${#goodemojis[@]}
B=${#bademojis[@]}

# Random value
((G=(RANDOM%G)+1))
((B=(RANDOM%B)+1))

# Get random emoji names
G="$goodemojis[$G]"
B="$bademojis[$B]"

# available colors
colors=(green blue cyan black red magenta yellow white)

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

# the folder colors
if [[ -n "$RAFIKI_FOLDER_COLOR" ]]; then
  if [[ ${colors[(i)$RAFIKI_FOLDER_COLOR]} -le ${#colors} ]]; then
    RAFIKI_FOLDER_COLOR="$fg[$RAFIKI_FOLDER_COLOR]"
  else
    echo "$fg_bold[red]$RAFIKI_FOLDER_COLOR is invalid, setting to cyan."
    RAFIKI_FOLDER_COLOR="$fg[cyan]"
  fi
else
  RAFIKI_FOLDER_COLOR="$fg[cyan]"
fi

# the git wrapper colors
if [[ -n "$RAFIKI_GIT_WRAPPER_COLOR" ]]; then
  if [[ ${colors[(i)$RAFIKI_GIT_WRAPPER_COLOR]} -le ${#colors} ]]; then
    RAFIKI_GIT_WRAPPER_COLOR="$fg_bold[$RAFIKI_GIT_WRAPPER_COLOR]"
  else
    echo "$fg_bold[red]$RAFIKI_GIT_WRAPPER_COLOR is invalid, setting to blue"
    RAFIKI_GIT_WRAPPER_COLOR="$fg_bold[blue]"
  fi
else
  RAFIKI_GIT_WRAPPER_COLOR="$fg_bold[blue]"
fi

# the git branch colors
if [[ -n "$RAFIKI_GIT_BRANCH_COLOR" ]]; then
  if [[ ${colors[(i)$RAFIKI_GIT_BRANCH_COLOR]} -le ${#colors} ]]; then
    RAFIKI_GIT_BRANCH_COLOR="$fg_bold[$RAFIKI_GIT_BRANCH_COLOR]"
  else
    echo "$fg_bold[red]$RAFIKI_GIT_BRANCH_COLOR is invalid, setting to red"
    RAFIKI_GIT_BRANCH_COLOR="$fg_bold[red]"
  fi
else
  RAFIKI_GIT_BRANCH_COLOR="$fg_bold[red]"
fi

local ret_status="%(?:%{$fg_bold[green]%}$RAFIKI_GOOD :%{$fg_bold[red]%}$RAFIKI_BAD )"
PROMPT='${ret_status} %{$RAFIKI_FOLDER_COLOR%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$RAFIKI_GIT_WRAPPER_COLOR%}git:%{$RAFIKI_GIT_BRANCH_COLOR(%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$RAFIKI_GIT_BRANCH_COLOR%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$RAFIKI_GIT_BRANCH_COLOR%})"
