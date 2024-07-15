#! /bin/bash

lm_eval --model hf \
    --model_args pretrained=meta-llama/Llama-2-7b-hf \
    --tasks arc_easy \
    --device cuda:0 \
    --batch_size 8