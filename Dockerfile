FROM runpod/worker-comfyui:latest-base

WORKDIR /comfyui

# Patch ComfyUI's FLUX.2 Klein support (fix num_heads issue)
RUN pip install --upgrade comfy-cli --break-system-packages -q || true && \
    cd /comfyui && git fetch && git checkout HEAD~0 && \
    git pull https://github.com/comfyanonymous/ComfyUI.git master -- \
    comfy/ldm/flux/model.py \
    comfy/supported_models.py \
    comfy/model_base.py || true

# cg-use-everywhere
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/chrisgoringe/cg-use-everywhere.git

# Add extra model paths config
COPY extra_model_paths.yaml /comfyui/extra_model_paths.yaml
