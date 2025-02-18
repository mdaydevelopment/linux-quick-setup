# default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# start thefuck
eval "$(thefuck --alias)"

# aws cli v2 prompt helper
# function aws2_profile() {
#     if [[ -n "${AWS_PROFILE:-}" ]]; then
#         echo -ne "${cloud}${AWS_PROFILE}"
#     else
#         echo -ne "default"
#     fi
# }
