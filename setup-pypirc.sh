#!/bin/bash

echo "[pypi]" > /root/.pypirc
echo "username = __token__" >> /root/.pypirc
echo "password = $PYPI_TOKEN" >> /root/.pypirc