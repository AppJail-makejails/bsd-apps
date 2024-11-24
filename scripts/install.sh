#!/bin/sh

. /scripts/lib.subr

if [ -z "${BSD_APP}" ]; then
    err "BSD_APP environment variable required but not defined."
    exit 1
fi

cd /tmp

info "BSD-APP to execute ${BSD_APP}"

info "Downloading"
if ! fetch "https://raw.githubusercontent.com/tschettervictor/bsd-apps/main/${BSD_APP}/${BSD_APP}-install.sh"; then
    err "Error downloading ${BSD_APP}"
    exit 1
fi

info "Fixing permissions"
chmod +x "${BSD_APP}-install.sh"

info "Installing"
if ! /bin/sh "./${BSD_APP}-install.sh"; then
    err "Error installing ${BSD_APP}"
    exit 1
fi

info "Removing script"
rm -f "${BSD_APP}-install.sh"
