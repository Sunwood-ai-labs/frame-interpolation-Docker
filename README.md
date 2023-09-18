# frame-interpolation Dockerfile

## Running

Download `film_net` and `vgg` to `output/Models` from [frame-interpolation's GDrive](https://drive.google.com/drive/folders/1q8110-qp225asX3DQvZnfLfJPkCHmDpy).

```bash
docker-compose run --build app
```

`/app/output` is a volume mapped to `./output/`, so you can use it to transfert data from and to the container.

Follow instructions from [frame-interpolation](https://github.com/google-research/frame-interpolation)

Examples:

```bash
python3 -m eval.interpolator_test --frame1 /output/test/1.png --frame2 /output/test/2.png --model_path Models/film_net/Style/saved_model --output_frame /output/out.png
python3 -m eval.interpolator_cli --pattern "/output/test/" --model_path Models/film_net/Style/saved_model --times_to_interpolate 6 --output_video
```
