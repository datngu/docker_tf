# docker_tf

## 

singularity build ndatth-deepsea-v0.0.0.img docker://ndatth/deepsea:v0.0.0
singularity shell --nv ndatth-deepsea-v0.0.0.img
python -c "import tensorflow as tf; print(tf.config.list_physical_devices('GPU'))