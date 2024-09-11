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
FROM python:3.11-rc-slim-bullseye

ENV AIOHTTP_NO_EXTENSIONS=1

RUN apt-get update \
    && apt-get install -y --no-install-recommends curl gcc git rsync vim libc6-dev autotools-dev automake libtool build-essential cmake pkg-config libopenblas-dev libzmq3-dev \
    && curl -sL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && npm install --global yarn \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip \
    && pip install cython \
    && pip install aiohttp --no-binary aiohttp \
    && pip install -e 'git+https://github.com/MagicStack/uvloop.git@master#egg=uvloop'
