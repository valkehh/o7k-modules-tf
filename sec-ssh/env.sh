#!/bin/sh

# env.sh

# Change the contents of this output to get the environment variables
# of interest. The output must be valid JSON, with strings for both
# keys and values.
cat <<EOF
{
  "OS_USERNAME": "$OS_USERNAME",
  "OS_TENANT_ID": "$OS_TENANT_ID",
  "OS_TENANT_NAME": "$OS_TENANT_NAME",
  "OS_AUTH_URL": "$OS_AUTH_URL",
  "OS_PASSWORD": "$OS_PASSWORD",
  "OS_REGION_NAME": "$OS_REGION_NAME"
}
EOF