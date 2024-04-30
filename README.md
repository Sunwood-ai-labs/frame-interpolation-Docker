
<p align="center">
<img src="https://github.com/Sunwood-ai-labs/frame-interpolation-Docker/blob/master/docs/icon/FILM_icon2.gif?raw=true" width="100%">
<br>
<h1 align="center">FILM Docker</h1>
<h2 align="center">
  ～frame interpolation～

## Running

Download `film_net` and `vgg` to `output/Models` from [frame-interpolation's GDrive](https://drive.google.com/drive/folders/1q8110-qp225asX3DQvZnfLfJPkCHmDpy).

```bash
docker-compose run app /bin/bash
```

`/app/output` is a volume mapped to `./output/`, so you can use it to transfert data from and to the container.

Follow instructions from [frame-interpolation](https://github.com/google-research/frame-interpolation)

Examples:

```bash
python3 -m eval.interpolator_test --frame1 /output/test/1.png --frame2 /output/test/2.png --model_path Models/film_net/Style/saved_model --output_frame /output/out.png
python3 -m eval.interpolator_cli --pattern "/output/test/" --model_path Models/film_net/Style/saved_model --times_to_interpolate 6 --output_video
```

```bash
python3 -m eval.interpolator_cli \
   --pattern "photos/example03" \
   --model_path pretrained_models/film_net/Style/saved_model \
   --times_to_interpolate 5 \
   --output_video
```
