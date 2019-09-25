#! /bin/bash

if [ "x$(jq .release ${GITHUB_EVENT_PATH})" == "x" ]; then
    echo "no release object"
    exit 1
fi

FILE=${INPUT_FILE}
SUFFIX=${INPUT_SUFFIX}
OS=${INPUT_OS}
ARCH=${INPUT_ARCH}
WITH_TAG=${INPUT_WITH_TAG}
UPLOAD_URL=$(jq .release.upload_url ${GITHUB_EVENT_PATH})
FILE_MIME_TYPE=$(file -b --mime-type ${FILE})

UPLOAD_FILE=$(basename ${FILE} ${SUFFIX})

if ${WITH_TAG}; then
    TAG=$(jq .release.tag_name ${GITHUB_EVENT_PATH})
    TAG=${TAG##v}
    UPLOAD_FILE="${UPLOAD_FILE}_${TAG}"
fi

if [ "x${OS}" != "x" ]; then
    UPLOAD_FILE="${UPLOAD_FILE}_${OS}"
fi

if [ "x${ARCH}" != "x" ]; then
    UPLOAD_FILE="${UPLOAD_FILE}_${ARCH}"
fi

UPLOAD_FILE="${UPLOAD_FILE}${SUFFIX}"

env

curl -s \
     -H "Authorization: ${GITHUB_TOKEN}" \
     -H "Content-Type: ${FILE_MIME_TYPE}" \
     --data-binary @${FILE} \
     "${upload_url}?name=${UPLOAD_FILE}"

echo "upload asset"
