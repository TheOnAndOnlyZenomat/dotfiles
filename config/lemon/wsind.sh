#! /bin/sh

set -e

parse_wspcstat() {
    while [ $# -gt 0 ]; do
        item="$1"
        name="${item#?}"
        case "$item" in
            [fFoOuU]*)
                case "$item" in
		    [FOU]*) UL="#55e7e7e7" FG="#ffffff";;
                    [fou]*) UL="#99181818" FG="#000000";;
                esac
                desktops="${desktops}%{A:bspc desktop -f ${name}:}%{U${UL}}%{u+}%{F${FG}}${name}%{F-}%{u-}%{U-} %{A}"
                ;;
        esac
        shift
    done
    printf "S %s\n" "${desktops}"
    unset desktops
}

bspc subscribe | awk '$0!=l { print; l=$0; fflush() }' | while read -r line; do
    arguments="$(echo "${line#?}" | tr ':' ' ')"
    maincmd="parse_wspcstat $arguments"
    eval "$maincmd"
done
