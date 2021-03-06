#!/bin/bash
#
# Copyright (C) 2015 Stratio (http://stratio.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Stratio Crossdata Deployment script

function usage {

  echo "Usage: ./make-distribution-crossdata.sh [OPTION]... [SPARK_BUILD_OPTIONS] "
  echo "Tool for build binary distributions of Spark with the Stratio Crossdata Pluggins"
  echo "Example: ./make-distribution-crossdata.sh --skip-java-test"
  echo ""
  echo "--profile            Crossdata Build Profile, Default: package"
  echo "--sparkDistibution   Spark Distribution URL to download used to build The Crossdata  distribution "
  echo "--sparkDistibutionFile Spark Distribution Bynaries used to build The Crossdata  distribution "
  echo "                     Default: http://apache.rediris.es/spark/spark-1.5.2/spark-1.5.2-bin-hadoop2.6.tgz"
  echo ""
  exit 1
}

# Keep all the arguments, then remove the XD specific ones and only keep the Spark arguments.
SPARK_BUILD_OPTIONS="$@"

while [[ $# > 0 ]]
do
key="$1"

case $key in
    --profile)
    PROFILE="$2"
    SPARK_BUILD_OPTIONS=${SPARK_BUILD_OPTIONS/"--profile $PROFILE"/}
    shift # past argument
    ;;
    --sparkDistribution)
    SPARK_REPO="$2"
    SPARK_BUILD_OPTIONS=${SPARK_BUILD_OPTIONS/"--sparkDistribution $SPARK_REPO"/}
    shift # past argument
    ;;
    --sparkDistibutionFile)
    SPARK_FILE="$2"
    SPARK_BUILD_OPTIONS=${SPARK_BUILD_OPTIONS/"--sparkDistibutionFile $SPARK_FILE"/}
    shift # past argument
    ;;
    --help)
    usage
    ;;
    *)
            # unknown option
    ;;
esac
shift # past argument or value
done

#Default Arguments
if [ -z "$SPARK_REPO" ]; then
    SPARK_DISTRIBUTION="http://apache.rediris.es/spark/spark-1.5.2/spark-1.5.2-bin-hadoop2.6.tgz"
fi

if [ -z "$PROFILE" ]; then
    PROFILE="package"
fi

TMPDIR=/tmp/stratio-crossdata-distribution

rm -rf ${TMPDIR}
mkdir -p ${TMPDIR}

LOCAL_EDITOR=$(which vim)

if [ -z "$LOCAL_EDITOR" ]; then
    $LOCAL_EDITOR=$(which vi)
fi

if [ -z "$LOCAL_EDITOR" ]; then
    echo "Cannot find any command line editor, ChangeLog.txt won't be edited interactively"
fi

echo "SPARK_DISTRIBUTION: ${SPARK_DISTRIBUTION}"
echo " >>> STRATIO CROSSDATA MAKE DISTRIBUTION <<< "

LOCAL_DIR=`pwd`

echo "LOCAL_DIR=$LOCAL_DIR"

mvn -version >/dev/null || { echo "Cannot find Maven in path, aborting"; exit 1; }

cd ..
RELEASE_VER=$(mvn org.apache.maven.plugins:maven-help-plugin:2.1.1:evaluate -Dexpression=project.version 2>/dev/null | grep -v '\[') || { echo "Cannot obtain project version, aborting"; exit 1; }
echo "RELEASE_VER: ${RELEASE_VER}"

if [ "$RELEASE_VER" = "" ]; then
   echo "Release version empty, aborting"; exit 1;
fi

#### Create Crossdata jars from github (master tag) through maven release plugin

echo "################################################"
echo "Compiling Crossdata"
echo "################################################"
echo "$(pwd)"
mvn clean package -DskipUTs -DskipITs -DskipTests -P"$PROFILE" || { echo "Cannot build Crossdata project, aborting"; exit 1; }

mkdir -p ${TMPDIR}/lib || { echo "Cannot create output lib directory"; exit 1; }

###cp -u ./*/target/alternateLocation/*.jar ${TMPDIR}/lib || { echo "Cannot copy alternate jars to output lib directory, aborting"; exit 1; }
### NOTE: -u option was removed because it's not valid on OSX
cp ./*/target/*-jar-with-dependencies.jar ${TMPDIR}/lib || { echo "Cannot copy target jars to output lib directory, aborting"; exit 1; }

git fetch --tags
latest_tag=$(git describe --tags `git rev-list --tags --max-count=1`)

echo -e "[${RELEASE_VER}]\n\n$(git log ${latest_tag}..HEAD)\n\n$(cat ChangeLog.txt)" > ${TMPDIR}/ChangeLog.txt

#if [ -n "$LOCAL_EDITOR" ]; then
#    $LOCAL_EDITOR ${TMPDIR}/ChangeLog.txt
#fi

echo "################################################"
echo "Copy Crossdata scripts"
echo "################################################"
mkdir -p ${TMPDIR}/bin || { echo "Cannot create output bin directory"; exit 1; }
cp scripts/stratio-xd-init.scala ${TMPDIR}/bin || { echo "Cannot copy stratio-xd-init.scala"; exit 1; }
cp scripts/stratio-xd-shell ${TMPDIR}/bin || { echo "Cannot copy stratio-xd-shell"; exit 1; }

chmod +x ${TMPDIR}/bin/stratio-xd-shell || { echo "Cannot modify stratio-xd-shell"; exit 1; }

echo "################################################"
echo "Creating Spark distribuition"
echo "from this version $SPARK_DISTRIBUTION"
echo "################################################"
cd ${TMPDIR}


SPARK_DISTRIBUTION_FILE=$(basename "$SPARK_DISTRIBUTION")
STRATIOSPARKDIR="${SPARK_DISTRIBUTION_FILE%.*}"


if [ -z "$SPARK_FILE" ]; then
    wget $SPARK_DISTRIBUTION || { echo "Cannot download Spark Distribution: ${SPARK_DISTRIBUTION}"; exit 1; }
else
    cp $SPARK_FILE .
fi

tar -xvf $SPARK_DISTRIBUTION_FILE || { echo "Cannot unzip Spark distribution $SPARK_DISTRIBUTION_FILE"; exit 1; }
rm -f $SPARK_DISTRIBUTION_FILE

DISTDIR=spark-crossdata-distribution-${RELEASE_VER}
DISTFILENAME=${DISTDIR}.tgz

cp ${TMPDIR}/lib/*.jar ${STRATIOSPARKDIR}/lib/
cp ${TMPDIR}/bin/stratio-xd-init.scala ${STRATIOSPARKDIR}/bin/
cp ${TMPDIR}/bin/stratio-xd-shell ${STRATIOSPARKDIR}/bin/

rm -f ${STRATIOSPARKDIR}/lib/*-sources.jar
rm -f ${STRATIOSPARKDIR}/lib/*-javadoc.jar
rm -f ${STRATIOSPARKDIR}/lib/*-tests.jar

mv ${STRATIOSPARKDIR}/ ${DISTDIR}

for lib in `ls ${DISTDIR}/lib/*-jar-with-dependencies.jar`
do
    zip -d $lib META-INF/*.RSA META-INF/*.DSA META-INF/*.SF log4j.properties
done

cp ${TMPDIR}/ChangeLog.txt ${DISTDIR}/

chmod 775 ${LOCAL_DIR}

cp ${LOCAL_DIR}/stratio-xd-* ${DISTDIR}

echo "DISTFILENAME: ${DISTFILENAME}"

tar czf ${DISTFILENAME} ${DISTDIR} || { echo "Cannot create tgz"; exit 1; }

mv ${DISTFILENAME} ${LOCAL_DIR}

echo "################################################"
echo "Finishing process"
echo "################################################"
cd ${LOCAL_DIR}
rm -rf ${TMPDIR}




