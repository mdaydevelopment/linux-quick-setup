# shellcheck shell=bash
# shellcheck disable=SC2034 # Expected behavior for themes.

function prompt_setter() {
    local clock_prompt scm_char scm_prompt_info ruby_version_prompt
    clock_prompt="$(clock_prompt)"
    function utc_clock_prompt() {
        local clock_color="${THEME_CLOCK_COLOR:-${normal?}}"
        local clock_format="${THEME_CLOCK_FORMAT:-"%H:%M:%S"}"
        local show_clock="${THEME_SHOW_CLOCK:-${THEME_CLOCK_CHECK:-true}}"
        #local clock_string="$(TZ='Etc/UTC' date +%H:%M:%S)"
        local clock_string="$(TZ='Etc/UTC' date +$clock_format)"

        if [[ "${show_clock}" == "true" ]]; then
            echo -ne "${clock_color}${CLOCK_THEME_PROMPT_PREFIX-}${clock_string}${CLOCK_THEME_PROMPT_SUFFIX-}"
        fi
    }
    utc_clock_prompt="$(utc_clock_prompt)"
    scm_char="$(scm_char)"
    scm_prompt_info="$(scm_prompt_info)"
    k8s_context_prompt="$(k8s_context_prompt)"
    function k8s_prompt() {
        wheel_code='\U2388'
        wheel="$(echo -e $wheel_code)"
        if [[ -n "${k8s_context_prompt:-}" ]]; then
            echo -ne " ${wheel}${k8s_context_prompt}"
        else
            echo -ne ""
        fi
    }
    k8s_context_prompt="$(k8s_prompt)"
    virtualenv_prompt="$(virtualenv_prompt)"
    aws_profile="$(aws_profile)"
    function aws_prompt() {
        cloud_symbol='\U00002601'
        cloud=$(echo -e ${cloud_symbol})
        if [[ $(aws_profile) != "default" ]]; then
            echo -ne " ${cloud}${aws_profile}"
        else
            echo -ne ""
        fi
    }
    aws_profile="$(aws_prompt)"
    function context_line() {
        if [[ -n "${scm_prompt_info:-}" ]] || \
            [[ -n "${k8s_context_prompt:-}" ]] || \
            [[ -n "${virtualenv_prompt:-}" ]] || \
            [[ -n "${aws_profile:-}" ]]; then
            PS1+="\n"
        fi
    }
    _save-and-reload-history 1 # Save history
    PS1="L(${clock_prompt})Z(${utc_clock_prompt}) ${scm_char} [${blue?}\u${reset_color?}@${green?}\H${reset_color?}] ${yellow?}\w${reset_color?}"
    context_line
    PS1+="${scm_prompt_info}${blue?}${wheel}${k8s_context_prompt}${reset_color?}${green?}${virtualenv_prompt}${yellow?}${aws_profile}${reset_color?} "
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
