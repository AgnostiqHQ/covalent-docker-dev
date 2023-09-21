# Copyright 2021 Agnostiq Inc.
#
# This file is part of Covalent.
#
# Licensed under the Apache License 2.0 (the "License"). A copy of the
# License may be obtained with this software package or at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Use of this file is prohibited except in compliance with the License.
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

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
