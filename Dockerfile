FROM tensorflow/serving
COPY / /
RUN apt-get -y update
ENV MODEL_NAME=img_classifier MODEL_BASE_PATH=/
EXPOSE 8500
EXPOSE 8501
RUN echo '#!/bin/bash \n\n\
    tensorflow_model_server \
    --rest_api_port=$PORT \
    --model_name=${MODEL_NAME} \
    --model_base_path=${MODEL_BASE_PATH}/${MODEL_NAME} \
    "$@"' > /usr/bin/tf_serving_entrypoint.sh \
    && chmod +x /usr/bin/tf_serving_entrypoint.sh
