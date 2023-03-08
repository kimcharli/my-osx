#!/bin/bash

# 2023/01/23 https://github.com/kimcharli/my-osx/tree/master/root/usr/local/bin/openai-api.sh
# 2023/03/08 update medel to gpt-3.5-turbo from text-davinci-003 based on the ChatGPT announcement

# API to talk to openai chatGPT jo
# Requirements:
#   The API key in a file TOKENFILE # https://beta.openai.com/account/api-keys
#   curl and jq

usage() {
    echo Usage: $0 "<question string>"    
}

# TOKENFILE example in secure location
# Authorization: Bearer sk-lTiwa0d...ZSNybz
# OpenAI-Organization: org-c3uB...XIX
# from https://platform.openai.com/account/api-keys
# from https://platform.openai.com/account/org-settings
TOKENFILE="$HOME/.ssh/openai-google-key"
AUTHORIZATION_HEADER=$(grep Authorization $TOKENFILE)
ORGANIZATION_HEADER=$(grep OpenAI-Organization $TOKENFILE)
JSON_HEADER="Content-Type: application/json"

PROMPT_STRING="'$*'"
# AI_MODEL=text-davinci-003
AI_MODEL=gpt-3.5-turbo


generate_post_data() {
    cat <<EOF
{
    "model": "$AI_MODEL",
    "prompt": "$PROMPT_STRING",
    "temperature": 0,
    "max_tokens":256
}
EOF
}

generate_post_data_v2() {
    cat <<EOF
{
    "model": "$AI_MODEL",
    "messages": [{"role": "user", "content": "$PROMPT_STRING"}]
}
EOF
}


display_input() {
    echo PROMPT_STRING = "$PROMPT_STRING"
    echo PROMPT_DATA = "$(generate_post_data)"
}

get_models() {
    curl -X GET https://api.openai.com/v1/models \
    -H "$AUTHORIZATION_HEADER" \
    -H "$ORGANIZATION_HEADER"
}

get_credit_grants() {
    curl -s -X GET "https://api.openai.com/dashboard/billing/credit_grants" \
    -H "$AUTHORIZATION_HEADER" \
    -H "$ORGANIZATION_HEADER"
}

get_usage() {
    curl -X GET "https://api.openai.com/v1/usage?date=2023-01-23" \
    -H "$AUTHORIZATION_HEADER" \
    -H "$ORGANIZATION_HEADER"
}

get_completions() {
    curl -s -X POST https://api.openai.com/v1/completions \
    -H "$AUTHORIZATION_HEADER" \
    -H "$ORGANIZATION_HEADER" \
    -H "$JSON_HEADER" \
    -d "$(generate_post_data)"
}

get_completions_v2() {
    curl -s -X POST https://api.openai.com/v1/chat/completions \
    -H "$AUTHORIZATION_HEADER" \
    -H "$JSON_HEADER" \
    -d "$(generate_post_data_v2)"
}


get_playground_completions() {
    curl -X POST https://api.openai.com/v1/engines/text-davinci-003-playground/completions\
    -H "$AUTHORIZATION_HEADER" \
    -H "$ORGANIZATION_HEADER" \
    -H "$JSON_HEADER" \
    -d '{"prompt":"What is chat GPT","max_tokens":256,"temperature":0.7,"top_p":1,"frequency_penalty":0,"presence_penalty":0,"best_of":1,"echo":true,"logprobs":0,"stream":true}'
}

if [ $# = 0 ];
then
    usage
    exit 1
fi

echo Prompt: "$PROMPT_STRING"
echo ====
# get_completions | jq -r '.choices[] | .text'
get_completions_v2 | jq -r '.choices[] | .message.content '
echo ====
get_credit_grants | jq -c '.grants.data[] | { "used_amount": .used_amount, "grant_amount": .grant_amount }'
