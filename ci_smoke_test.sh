#!/bin/bash
set -euxo pipefail

# This part checks that the local version of tf_dcos_core does not break terraform-dcos
mkdir .tf_dcos_core
mv * .tf_dcos_core
git remote add terraform-dcos https://github.com/dcos/terraform-dcos.git
git fetch terraform-dcos
git reset --hard terraform-dcos/master
find . -name '*.tf' -exec sed -i 's|github.com/dcos/tf_dcos_core|../.tf_dcos_core|g' {} \;
chmod +x ci_smoke_test.sh
./ci_smoke_test.sh

# This part checks that tf_dcos_core works on its own
mv terraform .tf_dcos_core/terraform
cd .tf_dcos_core
export TERRAFORM_PATH=${PWD}/terraform
${TERRAFORM_PATH} init
# Open DC/OS Check
for dir in ./open/dcos-versions/*
do
    version=${dir%*/}
    version=${version##*/}
    for dir2 in ./open/dcos-versions/${version}/*
    do
        role=${dir2%*/}
        role=${role##*/}
        ${TERRAFORM_PATH} validate -var "dcos_type=open" -var "role=${role}" -var "dcos_version=${version}"
        ${TERRAFORM_PATH} plan -var "dcos_type=open" -var "role=${role}" -var "dcos_version=${version}"
    done
done

# Enterprise DC/OS Check
for dir in ./ee/dcos-versions/*
do
    version=${dir%*/}
    version=${version##*/}
    for dir2 in ./ee/dcos-versions/${version}/*
    do
        role=${dir2%*/}
        role=${role##*/}
        ${TERRAFORM_PATH} validate -var "dcos_type=ee" -var "role=${role}" -var "dcos_version=${version}"
        ${TERRAFORM_PATH} plan -var "dcos_type=ee" -var "role=${role}" -var "dcos_version=${version}"
    done
done
