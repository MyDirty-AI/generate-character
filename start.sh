#!/bin/bash

echo "=== Running startup script ==="
bash /link_models.sh

echo "=== Starting ComfyUI worker ==="
exec /start.sh.bak 2>/dev/null || \
exec python -u /handler.py 2>/dev/null || \
exec python -u /start.py
