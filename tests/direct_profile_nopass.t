#!/usr/bin/env bash
. bash_tap_fd.sh

CMD=$(get_script)
TEST="$(get_test_data)/test_profile_firefox_nopassword/"


diff -u <(echo | ${CMD} ${TEST} | grep -C1 doesntexist || kill $$) <(get_user_data "doesntexist")
diff -u <(echo | ${CMD} ${TEST} | grep -C1 onemore || kill $$) <(get_user_data "onemore")
diff -u <(echo | ${CMD} ${TEST} | grep -C1 cömplex || kill $$) <(get_user_data "complex")

# vim: ai sts=4 et sw=4
