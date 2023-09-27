python3 main_pretrain.py \
    --dataset $1 \
    --backbone vit_tiny \
    --data_dir ./datasets \
    --max_epochs 200 \
    --gpus 0 \
    --accelerator gpu \
    --precision 16 \
    --optimizer sgd \
    --lars \
    --grad_clip_lars \
    --eta_lars 0.02 \
    --exclude_bias_n_norm \
    --scheduler warmup_cosine \
    --lr 0.3 \
    --classifier_lr 0.1 \
    --weight_decay 1e-6 \
    --batch_size 256 \
    --num_workers 12 \
    --brightness 0.4 \
    --contrast 0.4 \
    --saturation 0.2 \
    --hue 0.1 \
    --gaussian_prob 0.0 0.0 \
    --solarization_prob 0.0 0.2 \
    --crop_size 32 \
    --num_crops_per_aug 1 1 \
    --name dino-vit_tiny-$1 \
    --project solo-learn \
    --entity unitn-mhug \
    --save_checkpoint \
    --method dino \
    --proj_output_dim 256 \
    --proj_hidden_dim 2048 \
    --num_prototypes 4096 \
    --base_tau_momentum 0.9995 \
    --final_tau_momentum 1.0 \
    --momentum_classifier \
    --csv \
    --checkpoint_frequency=50 \
    --corrupt ${2:-ori} \
    --knn_eval --knn_k=200

# remove:
# --exclude_bias_n_norm \

# add:
# --norm_last_layer false \

# --optimizer adamw \
# --scheduler warmup_cosine \
# --lr 0.005 \
# --warmup_start_lr 1e-6 \
# --classifier_lr 3e-3 \
# --weight_decay 1e-4 \

# --gaussian_prob 1.0 0.1 \