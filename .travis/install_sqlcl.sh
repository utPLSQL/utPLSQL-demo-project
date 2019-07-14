#!/bin/bash
set -e

###############################3
# Declarations
###############################3
SCRIPT_DIR="$( dirname "${BASH_SOURCE[0]}" )"
SQLCL_FILE=sqlcl-18.3.0.259.2029.zip
AGREEMENT_URL="http://www.oracle.com/technetwork/developer-tools/sqlcl/downloads/index.html"
DOWNLOAD_URL="https://download.oracle.com/otn/java/sqldeveloper/${SQLCL_FILE}"
ZIP_TARGET_DIR=""
OTN_USER=""
OTN_PASS=""
OUTPUT_DIR=""

# Call the casperjs script to return the download url. Then download the file using curl.
downloadFile() {
    user=$1
    pass=$2
    agreementUrl=$3
    downloadUrl=$4
    outputFile=$5
    echo "Signing-in"
    downloadUrl=$(exec casperjs ${SCRIPT_DIR}/download.js ${user} ${pass} ${agreementUrl} ${downloadUrl})
    downloadUrl=${downloadUrl%$'\r'}
    echo "DownloadURL: $downloadUrl"
    curl -o ${outputFile} -L "$downloadUrl"
}

###############################3
# Main script
###############################3

#Evaluate script input parameters
while getopts "p:u:d:o:" OPTNAME; do
    case "${OPTNAME}" in
        "d") ZIP_TARGET_DIR="${OPTARG}" ;;
        "u") OTN_USER="${OPTARG}" ;;
        "p") OTN_PASS="${OPTARG}" ;;
        "o") OUTPUT_DIR="${OPTARG}" ;;
    esac
done

#Check parameters
if [[ "${ZIP_TARGET_DIR}" == "" ]]; then
    ZIP_TARGET_DIR="."
fi
if [[ "$OTN_USER" == "" ]] || [[ "$OTN_PASS" == "" ]]; then
    echo "Error: Oracle OTN username/password not specified."
    exit 1
fi
if [[ "$OUTPUT_DIR" == "" ]]; then
    echo "Error: Output directory not specified"
    exit 1
fi

if [[ ! -f "${ZIP_TARGET_DIR}/${SQLCL_FILE}" ]]; then
    sudo npm install -g phantomjs-prebuilt casperjs
    echo "Downloading sqlcl from Oracle"
    downloadFile ${OTN_USER} ${OTN_PASS} ${AGREEMENT_URL} ${DOWNLOAD_URL} "${ZIP_TARGET_DIR}/${SQLCL_FILE}"
else
    echo "Installing sqlcl from cache..."
fi;

echo "Unzipping sqlcl into: ${ZIP_TARGET_DIR}"
unzip -q "${ZIP_TARGET_DIR}/${SQLCL_FILE}" -d ${OUTPUT_DIR}
