#!/bin/bash

# Title       : Start-script "ehkt-user"
# Author      : software-development@gematik.de
# Description : starts the application "ehkt-user"
# Usage       : ./start.sh [TRACE | DEBUG | INFO | WARN | ERROR]
#               Without any input parameter or if the first input parameter is
#               invalid, then logging-area in the GUI uses log-level DEBUG.
#               Otherwise the GUI uses the given log-level.

# --- define some constants:
dateTime=$(date +%F__%H-%M-%S)
outDirectory="output/"
logback="${outDirectory}${dateTime}.xml"
stdout="${outDirectory}${dateTime}.stdout"
stderr="${outDirectory}${dateTime}.stderr"
prog="binaries/bin/eHKT-frontend"

# --- investigate command line parameter
logLevel="DEBUG"
if [[ $# -gt 0 ]]; then
  case $1 in #(
    "TRACE" | "INFO" | "WARN" | "ERROR")
      logLevel="$1"
      ;;
  esac
fi # end if

# --- start
export E_HKT_FRONTEND_OPTS="-Dlogback.configurationFile=${logback}"
echo "create output directory" && mkdir -p "${outDirectory}" && \
{
  echo "check program"       && test -x "${prog}" && \
  echo "create logback-file" && cp "resources/template" "${logback}" && \
  echo "set log-level"       && sed -i "s/LOGLEVEL/${logLevel}/" "${logback}" && \
  echo "set date+time"       && sed -i "s/yyyy-mm-dd__hh-mm-ss/${dateTime}/" "${logback}"
  echo "start" && "${prog}"
} 2>"${stderr}" | tee "${stdout}"
