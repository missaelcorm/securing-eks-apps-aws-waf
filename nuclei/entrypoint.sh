#!/bin/sh

HEADER_FLAG=""

[[ -z "$HEADER_WAF_BYPASS" || "$HEADER_WAF_BYPASS" == "" ]] && HEADER_FLAG="" || HEADER_FLAG="-H"
[[ "$DEBUG" == "1" ]] && DEBUG_FLAG="-debug" || DEBUG_FLAG=""

set -x
nuclei -u $TARGET -w $WORKFLOW $HEADER_FLAG "$HEADER_WAF_BYPASS" $DEBUG_FLAG
# nuclei -u $TARGET -w $WORKFLOW $HEADER_FLAG "$HEADER_WAF_BYPASS" -ms --omit-raw -omit-template $DEBUG_FLAG