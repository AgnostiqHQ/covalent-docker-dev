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
FROM python:3.11-rc-slim-bullseye

ENV AIOHTTP_NO_EXTENSIONS=1

RUN apt-get update \
  && apt-get install -y --no-install-recommends curl gcc git rsync vim libc6-dev autotools-dev automake libtool build-essential cmake pkg-config libopenblas-dev libzmq3-dev \
  && curl -sL https://deb.nodesource.com/setup_16.x | bash - \
  && apt-get install -y nodejs \
  && npm install --global yarn \
  && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip \
  && pip install cython \
  && pip install aiohttp --no-binary aiohttp \
  && pip install -e 'git+https://github.com/MagicStack/uvloop.git@master#egg=uvloop'
