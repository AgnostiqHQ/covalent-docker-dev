# Copyright 2021 Agnostiq Inc.
#
# This file is part of Covalent.
#
# Licensed under the GNU Affero General Public License 3.0 (the "License").
# A copy of the License may be obtained with this software package or at
#
#      https://www.gnu.org/licenses/agpl-3.0.en.html
#
# Use of this file is prohibited except in compliance with the License. Any
# modifications or derivative works of this file must retain this copyright
# notice, and modified files must contain a notice indicating that they have
# been altered from the originals.
#
# Covalent is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the License for more details.
#
# Relief from the License may be granted by purchasing a commercial license.

# syntax=docker/dockerfile:1
FROM centos/python-38-centos7

USER root
ENV NODE_VERSION "16.17.0"
RUN yum remove -y npm nodejs \
  && wget https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz \
  && xz -d node-v$NODE_VERSION-linux-x64.tar.xz \
  && tar xvf node-v$NODE_VERSION-linux-x64.tar \
  && mv node-v$NODE_VERSION-linux-x64 /usr/local/nodejs \
  && echo export PATH=$PATH:'/usr/local/nodejs/bin' >> /etc/profile \
  && source /etc/profile \
  && npm install -g yarn
