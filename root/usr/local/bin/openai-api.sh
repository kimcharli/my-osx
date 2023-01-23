#!/bin/bash

# 2023/01/23 https://github.com/kimcharli/my-osx/tree/master/root/usr/local/bin/openai-api.sh

# API to talk to openai chatGPT 
# Requirements:
#   The API key in a file TOKENFILE # https://beta.openai.com/account/api-keys
#   curl and jq

usage() {
    echo Usage: $0 "<question string>"    
}

TOKENFILE="$HOME/.ssh/openai-google-key"
OPEN_API_KEY=$(cat $TOKENFILE)
AUTHORIZATION_HEADER="Authorization: Bearer $OPEN_API_KEY"
ORGANIZATION_HEADER="OpenAI-Organization: org-c3uBW0PFGnfkQSuwX5cikXIX"
JSON_HEADER="Content-Type: application/json"
PROMPT_STRING="'$*'"

generate_post_data() {
    cat <<EOF
{
    "model": "text-davinci-003",
    "prompt": "$PROMPT_STRING",
    "temperature": 0,
    "max_tokens":256
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
get_completions | jq -r '.choices[] | .text'
echo ====
get_credit_grants | jq -c '.grants.data[] | { "used_amount": .used_amount, "grant_amount": .grant_amount }'
