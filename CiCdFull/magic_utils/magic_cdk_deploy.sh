# ------------------------------------------------
# Prepares fresh environment and executed AWS CDK deploy command.
# ------------------------------------------------

set -e
set -o pipefail

# If a virtual environment directory is already present, simply source it.
if [ -d "./venv" ]; then
  source venv/bin/activate
# However, if virtual environment is not present, create it, and then source it.
else
  source /usr/local/python_utils/new_venv.sh
  /usr/local/magic_utils/magic_pip_install.sh
fi

/usr/local/node_utils/install_aws_cdk.sh
source /usr/local/python_utils/clean_python.sh

./node_modules/aws-cdk/bin/cdk bootstrap
./node_modules/aws-cdk/bin/cdk deploy "*"
