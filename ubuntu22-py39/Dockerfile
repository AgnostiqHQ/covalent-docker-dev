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
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y --no-install-recommends curl gcc git rsync vim software-properties-common gpg-agent \
  && apt-add-repository -y ppa:deadsnakes/ppa \
  && apt update \
  && apt install -y python3.9 python3.9-distutils python3-pip \
  && update-alternatives --install /usr/bin/python python /usr/bin/python3.9 1 \
  && update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1 \
  && curl -sL https://deb.nodesource.com/setup_16.x | bash - \
  && apt-get install -y nodejs \
  && npm install --global yarn \
  && rm -rf /var/lib/apt/lists/*
