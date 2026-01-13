#!/bin/bash
# Lets the user ask questions of AI, abstracting over common options and configurations for
# `aichat`.
#
# Requirements:
#   - `aichat`
#   - $OPENAI_API_KEY

set -e

role="default" # Override from the user
session="" # Leaving this as-is opens a new session
while [[ $# -gt 0 ]]; do
    case "$1" in
        --role|-r)
            if [[ -n "$2" ]]; then
                role="$2"
                shift 2
            else
                echo "Error: '--role' requires a role name."
                exit 1
            fi
            ;;
        --session|-s)
            if [[ -n "$2" ]]; then
                session="$2"
                shift 2
            else
                echo "Error: '--session' requires a session name."
                exit 1
            fi
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

args=()
args+=("-r" "$role")

if [[ "$session" == "" ]]; then
    args+=("-s")
else
    args+=("-s" "$session")
fi

aichat "${args[@]}"
