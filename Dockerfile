FROM runpod/worker-comfyui:5.7.1-base

WORKDIR /comfyui

# cg-use-everywhere
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/chrisgoringe/cg-use-everywhere.git

# Add extra model paths config for FLUX.2 Klein
COPY extra_model_paths.yaml /comfyui/extra_model_paths.yaml
