# shellcheck shell=bash
# shellcheck disable=SC2034 # Expected behavior for themes.

function prompt_setter() {
    local clock_prompt scm_char scm_prompt_info ruby_version_prompt
    clock_prompt="$(clock_prompt)"
    scm_char="$(scm_char)"
    scm_prompt_info="$(scm_prompt_info)"
    k8s_context_prompt="$(k8s_context_prompt)"
    function k8s_prompt() {
        wheel_code='\U2388'
        wheel="$(echo -e $wheel_code)"
        if [[ -n "${k8s_context_prompt:-}" ]]; then
            echo -ne "${wheel}${k8s_context_prompt}"
        else
            echo -ne ""
        fi
    }
    k8s_context_prompt="$(k8s_prompt)"
    virtualenv_prompt="$(virtualenv_prompt)"
    aws2_profile="$(aws2_profile)"
    function aws2_prompt() {
        cloud_symbol='\U00002601'
        cloud=$(echo -e ${cloud_symbol})
        if [[ $(aws2_profile) != "default" ]]; then
            echo -ne "${cloud}${AWS_PROFILE}"
        else
            echo -ne ""
        fi
    }
    aws2_profile="$(aws2_prompt)"
    _save-and-reload-history 1 # Save history
    PS1="(${clock_prompt}) ${scm_char} [${blue?}\u${reset_color?}@${green?}\H${reset_color?}] ${yellow?}\w${reset_color?}${scm_prompt_info} ${blue?}${wheel}${k8s_context_prompt}${reset_color?} ${green?}${virtualenv_prompt} ${yellow?}${aws2_profile} ${reset_color?} "
    PS1+="\n${green?}→${reset_color?} "
    PS2='> '
    PS4='+ '
}

safe_append_prompt_command prompt_setter

SCM_THEME_PROMPT_DIRTY=" ✗"
SCM_THEME_PROMPT_CLEAN=" ✓"
SCM_THEME_PROMPT_PREFIX=" ("
SCM_THEME_PROMPT_SUFFIX=")"
RVM_THEME_PROMPT_PREFIX=" ("
RVM_THEME_PROMPT_SUFFIX=")"
