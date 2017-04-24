# This Dockerfile is based on the official SchemaCrawler Dockerfile: 
# https://hub.docker.com/r/sualeh/schemacrawler/~/dockerfile/
# 
# This version has two differences:
# 1. Amazon Redshift JDBC driver is added to lib. 
# 2. Entrypoint is defined to /bin/bash

# Schemacrawler starter shell script overrides Java CLASSPATH so simply adding the JAR to classpath would not work.

# Usage: docker run -v "$(pwd)":/share --rm -i -t lokori/schemacrawler

# Another example:
# docker run -v "$(pwd)":/share --rm -i -t --entrypoint="/schemacrawler/schemacrawler.sh" lokori/schemacrawler  -url=jdbc:redshift://192.0.1.1:9878/awesomedb -user=acc -infolevel=standard -command=schema --schemas=awesomedb.staging loglevel=CONFIG -password=XX -outputformat=png -outputfile=/share/schemadiagram.png


# The SchemaCrawler license:
# ========================================================================
# SchemaCrawler
# http://www.schemacrawler.com
# Copyright (c) 2000-2017, Sualeh Fatehi <sualeh@hotmail.com>.
# All rights reserved.
# ------------------------------------------------------------------------
#
# SchemaCrawler is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
# SchemaCrawler and the accompanying materials are made available under
# the terms of the Eclipse Public License v1.0, GNU General Public License
# v3 or GNU Lesser General Public License v3.
#
# You may elect to redistribute this code under any of these licenses.
#
# The Eclipse Public License is available at:
# http://www.eclipse.org/legal/epl-v10.html
#
# The GNU General Public License v3 and the GNU Lesser General Public
# License v3 are available at:
# http://www.gnu.org/licenses/
#
# ========================================================================


FROM sualeh/schemacrawler

COPY RedshiftJDBC42-1.2.1.1001.jar lib/

COPY schemacrawler.config.properties config/

ENTRYPOINT /bin/bash

MAINTAINER Antti Virtanen <antti.virtanen@solita.fi>
